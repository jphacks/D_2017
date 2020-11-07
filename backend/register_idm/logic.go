package main

import (
	"fmt"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

// RegisterIdmLogic - IDｍ登録のロジック
type registerIdmLogic struct {
	cardRepository repository.CardRepositoryInterface
	userRepository repository.UserRepositoryInterface
}

// NewRegisterIdmLogic - DIによるlogicの初期化
func newRegisterIdmLogic(cardRepository repository.CardRepositoryInterface, userRepository repository.UserRepositoryInterface) *registerIdmLogic {
	return &registerIdmLogic{
		cardRepository: cardRepository,
		userRepository: userRepository,
	}
}

// ここにロジックを書く
func (logic *registerIdmLogic) handle(idm string, userID string) (*model.Card, error) {

	// ユーザが存在しているか確認
	user, err := logic.userRepository.SelectByID(userID)
	if err != nil {
		fmt.Println("Error in userRepository.SelectByID")
		return nil, err
	}

	// ユーザが未登録なら登録する
	if user == nil {
		user, err = model.NewUser(userID)
		if err != nil {
			return nil, err
		}
		logic.userRepository.Insert(user)
	}

	card, err := model.NewCard(idm, userID)
	if err != nil {
		return nil, err
	}

	return logic.cardRepository.Insert(card)
}
