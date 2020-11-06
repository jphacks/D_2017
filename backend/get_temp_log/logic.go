package main

import (
	"encoding/json"

	"github.com/jphacks/D_2017/repository"
)

// RegisterIdmLogic - IDｍ登録のロジック
type getTempLogLogic struct {
	bodyTemperatureRepository repository.BodyTemperatureRepositoryInterface
}

// NewRegisterIdmLogic - DIによるlogicの初期化
func newGetTempLogLogic(repos repository.BodyTemperatureRepositoryInterface) *getTempLogLogic {
	return &getTempLogLogic{
		bodyTemperatureRepository: repos,
	}
}

// ここにロジックを書く
func (logic *getTempLogLogic) handle(userID string, offset int, count int) (string, error) {
	logs, err := logic.bodyTemperatureRepository.SelectByUserID(userID, offset, count)
	if err != nil {
		return "", err
	}

	res, err := json.Marshal(logs)
	if err != nil {
		return "", err
	}

	return string(res), err
}
