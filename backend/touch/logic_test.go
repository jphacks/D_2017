package main

import (
	"testing"
	"time"

	"github.com/jphacks/D_2017/repository"

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
	return &model.Card{
		IDm:    "0000000000000000",
		UserID: "test-user",
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

func newMcokReaderRepository() repository.ReaderRepositoryInterface {
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
		UserID:     "test-user",
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
	array[0] = model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[0],
	}
	array[1] = model.BodyTemperature{
		ID:          43,
		UserID:      "test-user",
		Temperature: 36.3,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[1],
	}
	array[2] = model.BodyTemperature{
		ID:          44,
		UserID:      "test-user",
		Temperature: 36.6,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[2],
	}
	res := array[:]
	return &res, nil
}

func TestHandle(t *testing.T) {
}
