package main

import (
	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type pendingMembersLogic struct {
	memberRepository repository.MemberRepositoryInterface
	adminRepository  repository.AdminRepositoryInterface
}

func newPendingMembersLogic(memRepos repository.MemberRepositoryInterface, adminRepos repository.AdminRepositoryInterface) *pendingMembersLogic {
	return &pendingMembersLogic{
		memberRepository: memRepos,
		adminRepository:  adminRepos,
	}
}

func (logic *pendingMembersLogic) handle(userID string, roomID int) (*response.PendingMemberResponse, error) {
	admin, err := logic.adminRepository.SelectByUserIDAndRoomID(userID, roomID)
	if err != nil {
		return nil, err
	}
	if admin == nil {
		return nil, nil
	}

	memberRecords, err := logic.memberRepository.SelectByRoomIDAndState(roomID, enum.PENDING)
	if err != nil {
		return nil, err
	}

	var members []response.Member
	for _, member := range *memberRecords {
		members = append(members, response.Member{
			UserID: member.UserID,
		})
	}
	return &response.PendingMemberResponse{Members: members}, nil
}
