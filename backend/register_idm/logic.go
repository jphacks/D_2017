package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

// RegisterIdmLogic - IDｍ登録のロジック
type registerIdmLogic struct {
	cardRepository repository.CardRepositoryInterface
}

// NewRegisterIdmLogic - DIによるlogicの初期化
func newRegisterIdmLogic(cardRepository repository.CardRepositoryInterface) *registerIdmLogic {
	return &registerIdmLogic{
		cardRepository: cardRepository,
	}
}

// ここにロジックを書く
func (logic *registerIdmLogic) handle(idm string, userID string) (*model.Card, error) {
	card := model.Card{
		IDm:    idm,
		UserID: userID,
	}
	return logic.cardRepository.Insert(&card)
}
