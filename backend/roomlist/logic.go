package main

import (
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type RoomListLogic struct {
	adminRepository repository.AdminRepositoryInterface
	roomRepository  repository.RoomRepositoryInterface
}

func newRoomListLogic(adminRepository repository.AdminRepositoryInterface,
	roomRepository repository.RoomRepositoryInterface) *RoomListLogic {
	return &RoomListLogic{adminRepository, roomRepository}
}

func (logic *RoomListLogic) handle(userID string) (*response.RoomListResponse, error) {
	// admin一覧
	admins, err := logic.adminRepository.SelectByUserID(userID)
	if err != nil {
		return nil, err
	}

	var rooms []*response.Room
	for _, admin := range *admins {
		room, err := logic.roomRepository.SelectByID(admin.RoomID)
		if err != nil {
			return nil, err
		}
		roominfo := response.Room{
			RoomID:               room.RoomID,
			Name:                 room.Name,
			LimitNumber:          room.LimitNumber,
			LimitBodyTemperature: room.LimitBodyTemperature,
			AllowMissing:         room.AllowMissing,
		}
		rooms = append(rooms, &roominfo)
	}
	res := response.RoomListResponse{
		Rooms: rooms,
	}
	return &res, nil
}
