package main

import (
	"testing"
	"time"

	"github.com/jphacks/D_2017/repository"
	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
)

type mockCardRepository struct{}

func (cardRepository *mockCardRepository) Insert(record *model.Card) (*model.Card, error) {
	return nil, nil
}
func (cardRepository *mockCardRepository) DeleteByIDm(IDm string) error {
	return nil
}
func (cardRepository *mockCardRepository) SelectByIDm(IDm string) (*model.Card, error) {
	//駄目カード
	if IDm == "0000000000000000" {
		return &model.Card{
			IDm:    IDm,
			UserID: "reject-user",
		}, nil
	}

	//退室カード
	if IDm == "0000000000000002" {
		return &model.Card{
			IDm:    IDm,
			UserID: "exit-user",
		}, nil
	}

	return &model.Card{
		IDm:    "0000000000000001",
		UserID: "ok-user",
	}, nil
}
func newMockCardRepository() repository.CardRepositoryInterface {
	return &mockCardRepository{}
}

type mockRoomRepository struct{}

func newMockRoomRepository() repository.RoomRepositoryInterface {
	return &mockRoomRepository{}
}
func (r *mockRoomRepository) Insert(*model.Room) (*model.Room, error) {
	return nil, nil
}

func (r *mockRoomRepository) Update(*model.Room) (*model.Room, error) {
	return nil, nil
}

func (r *mockRoomRepository) SelectByID(int) (*model.Room, error) {
	return &model.Room{
		RoomID:               42,
		Name:                 "room1",
		LimitNumber:          2,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}, nil
}

type mockReaderRepository struct{}

func newMockReaderRepository() repository.ReaderRepositoryInterface {
	return &mockReaderRepository{}
}
func (r *mockReaderRepository) Insert(*model.Reader) (*model.Reader, error) {
	return nil, nil
}
func (r *mockReaderRepository) SelectByUserID(string) (*[]model.Reader, error) {
	return nil, nil
}
func (r *mockReaderRepository) SelectByRoomID(int) (*[]model.Reader, error) {
	return nil, nil
}
func (r *mockReaderRepository) SelectByMACAddress(macAddress string) (*model.Reader, error) {
	return &model.Reader{
		MACAddress: "0000000000000000",
		UserID:     "admin",
		RoomID:     42,
	}, nil
}

type mockBodyTemperatureRepository struct{}

func newMockBodyTemperatureRepository() repository.BodyTemperatureRepositoryInterface {
	return &mockBodyTemperatureRepository{}
}
func (m *mockBodyTemperatureRepository) Insert(*model.BodyTemperature) (*model.BodyTemperature, error) {
	return nil, nil
}
func (m *mockBodyTemperatureRepository) UpdateIsTrustedByID(bool, int) (*model.BodyTemperature, error) {
	return nil, nil
}
func (m *mockBodyTemperatureRepository) SelectByID(int) (*model.BodyTemperature, error) {
	return nil, nil
}
func (m *mockBodyTemperatureRepository) SelectByUserID(string, int, int) (*[]model.BodyTemperature, error) {
	return nil, nil
}
func (m *mockBodyTemperatureRepository) SelectByUserIDBetween(userID string, since time.Time, until time.Time) (*[]model.BodyTemperature, error) {
	var array [3]model.BodyTemperature
	times := [3]time.Time{
		time.Date(2014, time.December, 31, 12, 15, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 14, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC),
	}

	var idSince int
	var temperature float32
	if userID == "ok-user" {
		idSince = 42
		temperature = 36.0
	} else {
		idSince = 21
		temperature = 38.0
	}
	for i := 0; i < 3; i++ {
		array[i] = model.BodyTemperature{
			ID:          idSince + i,
			UserID:      userID,
			Temperature: temperature,
			MACAddress:  "00:00:00:00:00",
			IsTrusted:   true,
			CreatedAt:   &times[i],
		}
	}

	res := array[:]
	return &res, nil
}

type mockLogRepository struct{}

func newMockLogRepository() repository.LogRepositoryInterface {
	return &mockLogRepository{}
}
func (r *mockLogRepository) Insert(log *model.Log) (*model.Log, error) {
	return &model.Log{
		ID:        42,
		UserID:    log.UserID,
		RoomID:    log.RoomID,
		EnteredAt: log.EnteredAt,
	}, nil
}
func (r *mockLogRepository) SelectByID(int) (*model.Log, error) {
	return nil, nil
}
func (r *mockLogRepository) SelectByUserIDAndRoomID(string, int) (*[]model.Log, error) {
	return nil, nil
}
func (r *mockLogRepository) SelectByRoomID(int) (*[]model.Log, error) {
	return nil, nil
}

func (r *mockLogRepository) SelectEnteringByRoomID(roomID int) (*[]model.Log, error) {
	var result []model.Log
	time := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	result = append(result, model.Log{
		ID:        1,
		UserID:    "exit-user",
		RoomID:    42,
		EnteredAt: &time,
	})
	return &result, nil
}
func (r *mockLogRepository) UpdateLeftAtByID(id int, LeftAt time.Time) (*model.Log, error) {
	enter := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	log := model.Log{
		ID:        id,
		UserID:    "exit-user",
		RoomID:    42,
		EnteredAt: &enter,
		LeftAt:    &LeftAt,
	}
	return &log, nil
}

func TestHandle(t *testing.T) {
	logic := newTouchLogic(newMockLogRepository(), newMockReaderRepository(), newMockCardRepository(), newMockRoomRepository(), newMockBodyTemperatureRepository())

	//入室できなかった
	unixtime := "1420029024"
	idm := "0000000000000000"
	macAddress := "00:00:00:00:00"
	res, err := logic.handle(unixtime, idm, macAddress)
	if err != nil {
		t.Fatal(err)
	}
	expect := `{"result":"reject"}`
	assert.Equal(t, expect, res)

	//入室できた
	idm = "0000000000000001"
	res, err = logic.handle(unixtime, idm, macAddress)
	if err != nil {
		t.Fatal(err)
	}
	expect = `{"result":"accept"}`
	assert.Equal(t, expect, res)

	//退室
	idm = "0000000000000002"
	res, err = logic.handle(unixtime, idm, macAddress)
	if err != nil {
		t.Fatal(err)
	}
	expect = `{"result":"exit"}`
	assert.Equal(t, expect, res)

}
