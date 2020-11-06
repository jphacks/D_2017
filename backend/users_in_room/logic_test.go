package main

import (
	"testing"
	"time"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type mockLogRepository struct{}

func newMockLogRepository() repository.LogRepositoryInterface {
	return &mockLogRepository{}
}

func (m *mockLogRepository) Insert(*model.Log) (*model.Log, error) {
	return nil, nil
}
func (m *mockLogRepository) UpdateLeftAtByID(int, time.Time) (*model.Log, error) {
	return nil, nil
}
func (m *mockLogRepository) SelectByID(int) (*model.Log, error) {
	return nil, nil
}
func (m *mockLogRepository) SelectByUserIDAndRoomID(string, int) (*[]model.Log, error) {
	return nil, nil
}
func (m *mockLogRepository) SelectByRoomID(int) (*[]model.Log, error) {
	return nil, nil
}
func (m *mockLogRepository) SelectEnteringByRoomID(roomID int) (*[]model.Log, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	logs := []model.Log{
		{ID: 1, UserID: "user1", RoomID: 42, EnteredAt: &t, LeftAt: nil},
		{ID: 2, UserID: "user2", RoomID: 42, EnteredAt: &t, LeftAt: nil},
		{ID: 3, UserID: "user3", RoomID: 42, EnteredAt: &t, LeftAt: nil},
	}
	return &logs, nil
}

func TestHandle(t *testing.T) {
	logic := newUsersInRoomLogic(newMockLogRepository())
	res, err := logic.handle(42)
	if err != nil {
		t.Fatal(err)
	}
	expect := &response.UsersInRoomResponse{
		Members: []response.Member{
			{UserID: "user1"},
			{UserID: "user2"},
			{UserID: "user3"},
		},
	}
	assert.Equal(t, *res, *expect)
}
