package repository

import (
	"time"

	"github.com/jphacks/D_2017/model"
)

type LogRepositoryInterface interface {
	Insert(*model.Log) (*model.Log, error)
	UpdateLeftAtByID(int, *time.Time) (*model.Log, error)
	SelectByUserIDAndRoomID(string, int) (*[]model.Log, error)
	SelectByRoomID(int) (*[]model.Log, error)
	SelectEnteringByRoomID(int) (*[]model.Log, error)
}
