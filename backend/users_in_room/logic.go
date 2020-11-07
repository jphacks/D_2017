package main

import (
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type usersInRoomLogic struct {
	logRepository repository.LogRepositoryInterface
}

func newUsersInRoomLogic(logRepository repository.LogRepositoryInterface) *usersInRoomLogic {
	return &usersInRoomLogic{
		logRepository,
	}
}

func (logic *usersInRoomLogic) handle(roomID int) (*response.UsersInRoomResponse, error) {
	logs, err := logic.logRepository.SelectEnteringByRoomID(roomID)
	if err != nil {
		return nil, err
	}

	var members []response.Member
	for _, log := range *logs {
		members = append(members, response.Member{
			UserID: log.UserID,
		})
	}
	return &response.UsersInRoomResponse{Members: members}, nil
}
