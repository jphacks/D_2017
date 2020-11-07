package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type mockAdminRepository struct{}

func newMockAdminRepository() repository.AdminRepositoryInterface {
	return &mockAdminRepository{}
}
func (m *mockAdminRepository) Insert(*model.Admin) (*model.Admin, error) {
	return nil, nil
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
	var result []model.Admin
	for i := 0; i < 3; i++ {
		admin := model.Admin{
			UserID: userID,
			RoomID: i + 1,
		}
		result = append(result, admin)
	}
	return &result, nil
}

type mockRoomRepository struct{}

func newMockRoomRepository() repository.RoomRepositoryInterface {
	return &mockRoomRepository{}
}

func (m *mockRoomRepository) Insert(*model.Room) (*model.Room, error) {
	return nil, nil
}
func (m *mockRoomRepository) Update(*model.Room) (*model.Room, error) {
	return nil, nil
}
func (m *mockRoomRepository) SelectByID(id int) (*model.Room, error) {
	if id == 1 {
		return &model.Room{
			RoomID:               id,
			Name:                 "room1",
			LimitNumber:          5,
			LimitBodyTemperature: 37.0,
			AllowMissing:         true,
		}, nil
	} else if id == 2 {
		return &model.Room{
			RoomID:               id,
			Name:                 "room2",
			LimitNumber:          10,
			LimitBodyTemperature: 37.5,
			AllowMissing:         false,
		}, nil
	} else {
		return &model.Room{
			RoomID:               id,
			Name:                 "roomElse",
			LimitNumber:          8,
			LimitBodyTemperature: 37.0,
			AllowMissing:         true,
		}, nil
	}
}

func TestHandle(t *testing.T) {
	logic := newRoomListLogic(newMockAdminRepository(), newMockRoomRepository())
	res, err := logic.handle("test-user")
	if err != nil {
		t.Fatal(err)
	}

	expect := &response.RoomListResponse{
		Rooms: []*response.Room{
			{RoomID: 1, Name: "room1", LimitNumber: 5, LimitBodyTemperature: 37.0, AllowMissing: true},
			{RoomID: 2, Name: "room2", LimitNumber: 10, LimitBodyTemperature: 37.5, AllowMissing: false},
			{RoomID: 3, Name: "roomElse", LimitNumber: 8, LimitBodyTemperature: 37.0, AllowMissing: true},
		},
	}

	assert.Equal(t, *res, *expect)
}
