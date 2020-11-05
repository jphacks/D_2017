package repository

import (
	"github.com/jphacks/D_2017/model"
)

type MemberRepositoryInterface interface {
	Insert(*model.Member) (*model.Member, error)
	Update(*model.Member) (*model.Member, error)
	SelectByUserIDAndRoomID(string, int) (*model.Member, error)
	SelectByUserID(string) (*[]model.Member, error)
	SelectByRoomIdAndState(int, int) (*[]model.Member, error)
}
