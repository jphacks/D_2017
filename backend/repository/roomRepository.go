package repository

import (
	"github.com/jphacks/D_2017/model"
)

type RoomRepositoryInterface interface {
	Insert(*model.Room) (*model.Room, error)
	Update(*model.Room) (*model.Room, error)
	SelectByID(int) (*model.Room, error)
}
