package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type mockRoomRepository struct{}

func newMockRoomRepository() repository.RoomRepositoryInterface {
	return &mockRoomRepository{}
}

func (m *mockRoomRepository) Insert(*model.Room) (*model.Room, error) {
	return nil, nil
}
func (m *mockRoomRepository) Update(*model.Room) (*model.Room, error) {
	return &model.Room{
		RoomID:               42,
		Name:                 "room1",
		LimitNumber:          6,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}, nil
}
func (m *mockRoomRepository) SelectByID(id int) (*model.Room, error) {
	return nil, nil
}

func TestHandle(t *testing.T) {
	logic := newRoomUpdateLogic(newMockRoomRepository())

	info := RoomInfo{
		Name:                 "room1",
		LimitNumber:          6,
		LimitBodyTemperature: 37.0,
		AllowMissing:         true,
	}

	room, err := logic.handle("test-user", 42, info)
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

	assert.Equal(t, *room, *expectRoom)
}
