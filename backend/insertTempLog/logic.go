package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

// insertTempLogLogic - IDｍ登録のロジック
type insertTempLogLogic struct {
	bodyTemperatureRepository repository.BodyTemperatureRepositoryInterface
}

// newInsertTempLogLogic - DIによるlogicの初期化
func newInsertTempLogLogic(bodyTemperatureRepository repository.BodyTemperatureRepositoryInterface) *insertTempLogLogic {
	return &insertTempLogLogic{
		bodyTemperatureRepository: bodyTemperatureRepository,
	}
}

func (logic *insertTempLogLogic) handle(userID string, temperature float32, macAdress string) (*model.BodyTemperature, error) {
	temp, err := model.NewBodyTemperature(userID, temperature, macAdress)
	if err != nil {
		return nil, err
	}
	return logic.bodyTemperatureRepository.Insert(temp)
}
