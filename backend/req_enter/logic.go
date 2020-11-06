package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type ReqEnterLogic struct {
	memberRepository repository.MemberRepositoryInterface
}

func newReqEnterLogic(memberRepository repository.MemberRepositoryInterface) *ReqEnterLogic {
	return &ReqEnterLogic{memberRepository}
}

func (logic *ReqEnterLogic) handle(userID string, roomID int) (*model.Member, error) {
	// create member
	member, err := model.NewMember(userID, roomID)
	if err != nil {
		return nil, err
	}

	// update
	return logic.memberRepository.Insert(member)
}
