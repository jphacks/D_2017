package main

import (
	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type roomMembersLogic struct {
	memberRepository repository.MemberRepositoryInterface
	adminRepository  repository.AdminRepositoryInterface
}

func newRoomMembersLogic(memRepos repository.MemberRepositoryInterface, adminRepos repository.AdminRepositoryInterface) *roomMembersLogic {
	return &roomMembersLogic{
		memberRepository: memRepos,
		adminRepository:  adminRepos,
	}
}

func (logic *roomMembersLogic) handle(userID string, roomID int) (*response.RoomMemberResponse, error) {
	admin, err := logic.adminRepository.SelectByUserIDAndRoomID(userID, roomID)
	if err != nil {
		return nil, err
	}
	if admin == nil {
		return nil, nil
	}

	memberRecords, err := logic.memberRepository.SelectByRoomIDAndState(roomID, enum.ACCEPT)
	if err != nil {
		return nil, err
	}

	var members []response.Member
	for _, member := range *memberRecords {
		members = append(members, response.Member{
			UserID: member.UserID,
		})
	}
	return &response.RoomMemberResponse{Members: members}, nil
}
