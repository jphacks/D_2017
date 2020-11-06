package main

import (
	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type permitEnterLogic struct {
	memberRepository repository.MemberRepositoryInterface
	adminRepository  repository.AdminRepositoryInterface
}

func newPermitEnterLogic(memRepos repository.MemberRepositoryInterface, adminRepos repository.AdminRepositoryInterface) *permitEnterLogic {
	return &permitEnterLogic{
		memberRepository: memRepos,
		adminRepository:  adminRepos,
	}
}

func (logic *permitEnterLogic) handle(userID string, roomID int,
	memberID string, isPermitted bool) (*model.Member, error) {
	admin, err := logic.adminRepository.SelectByUserIDAndRoomID(userID, roomID)
	if err != nil {
		return nil, err
	}
	if admin == nil {
		return nil, nil
	}

	var state int
	if isPermitted {
		state = enum.ACCEPT
	} else {
		state = enum.REJECT
	}

	member, err := model.NewMember(memberID, roomID)
	member.State = state

	return logic.memberRepository.Update(member)
}
