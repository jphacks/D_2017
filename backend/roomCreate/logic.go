package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type RoomCreateLogic struct {
	adminRepository repository.AdminRepositoryInterface
	roomRepository  repository.RoomRepositoryInterface
}

func newRoomCreateLogic(adminRepository repository.AdminRepositoryInterface,
	roomRepository repository.RoomRepositoryInterface) *RoomCreateLogic {
	return &RoomCreateLogic{adminRepository, roomRepository}
}

func (logic *RoomCreateLogic) handle(userID string, info RoomInfo) (*model.Room, *model.Admin, error) {
	// create room
	room, err := model.NewRoom(info.Name, info.LimitNumber, info.LimitBodyTemperature, info.AllowMissing)
	if err != nil {
		return nil, nil, err
	}

	// insert room
	room, err = logic.roomRepository.Insert(room)
	if err != nil {
		return nil, nil, err
	}

	// create admin
	var admin *model.Admin
	admin, err = model.NewAdmin(userID, room.RoomID)

	// insert admin
	admin, err = logic.adminRepository.Insert(admin)
	if err != nil {
		return nil, nil, err
	}

	return room, admin, nil
}
