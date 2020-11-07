package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type mockAdminRepository struct{}

func newMockAdminRepository() repository.AdminRepositoryInterface {
	return &mockAdminRepository{}
}
func (m *mockAdminRepository) Insert(*model.Admin) (*model.Admin, error) {
	return &model.Admin{
		UserID: "test-user",
		RoomID: 42,
	}, nil
}
func (m *mockAdminRepository) SelectByUserIDAndRoomID(string, int) (*model.Admin, error) {
	return nil, nil
}
func (m *mockAdminRepository) SelectByRoomID(int) (*[]model.Admin, error) {
	return nil, nil
}
func (m *mockAdminRepository) DeleteByUserIDAndRoomID(string, int) error {
	return nil
}
func (m *mockAdminRepository) SelectByUserID(userID string) (*[]model.Admin, error) {
	return nil, nil
}

type mockRoomRepository struct{}

func newMockRoomRepository() repository.RoomRepositoryInterface {
	return &mockRoomRepository{}
}

func (m *mockRoomRepository) Insert(*model.Room) (*model.Room, error) {
	return &model.Room{
		RoomID:               42,
		Name:                 "room1",
		LimitNumber:          6,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}, nil
}
func (m *mockRoomRepository) Update(*model.Room) (*model.Room, error) {
	return nil, nil
}
func (m *mockRoomRepository) SelectByID(id int) (*model.Room, error) {
	return nil, nil
}

func TestHandle(t *testing.T) {
	logic := newRoomCreateLogic(newMockAdminRepository(), newMockRoomRepository())

	info := RoomInfo{
		Name:                 "room1",
		LimitNumber:          6,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}

	room, admin, err := logic.handle("test-user", info)
	if err != nil {
		t.Fatal(err)
	}

	expectRoom := &model.Room{
		RoomID:               42,
		Name:                 "room1",
		LimitNumber:          6,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}

	expectAdmin := &model.Admin{
		UserID: "test-user",
		RoomID: 42,
	}

	assert.Equal(t, *room, *expectRoom)
	assert.Equal(t, *admin, *expectAdmin)
}
