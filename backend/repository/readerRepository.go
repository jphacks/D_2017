package repository

import (
	"github.com/jphacks/D_2017/model"
)

type ReaderRepositoryInterface interface {
	Insert(*model.Reader) (*model.Reader, error)
	SelectByMacAddress(string) (*model.Reader, error)
	SelectByUserId(string) (*[]model.Reader, error)
	SelectByRoomId(int) (*[]model.Reader, error)
}
