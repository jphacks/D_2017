package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type RoomUpdateLogic struct {
	roomRepository repository.RoomRepositoryInterface
}

func newRoomUpdateLogic(roomRepository repository.RoomRepositoryInterface) *RoomUpdateLogic {
	return &RoomUpdateLogic{roomRepository}
}

func (logic *RoomUpdateLogic) handle(userID string, roomID int, info RoomInfo) (*model.Room, error) {
	// create room
	room, err := model.NewRoom(info.Name, info.LimitNumber, info.LimitBodyTemperature, info.AllowMissing)
	if err != nil {
		return nil, err
	}
	room.RoomID = roomID

	// update
	return logic.roomRepository.Update(room)
}
