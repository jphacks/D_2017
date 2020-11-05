package repository

import (
	"github.com/jphacks/D_2017/model"
)

type AdminRepositoryInterface interface {
	Insert(*model.Admin) (*model.Admin, error)
	SelectByUserIDAndRoomID(string, int) (*model.Admin, error)
	SelectByUserID(string) (*[]model.Admin, error)
	SelectByRoomId(int) (*[]model.Admin, error)
	DeleteByUserIDAndRoomID(string, int) error
}
