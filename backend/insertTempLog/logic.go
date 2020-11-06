package main

import (
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

// insertTempLogLogic - 体温登録のロジック
type insertTempLog struct {
	TempLogRepository repository.BodyTemperatureRepositoryInterface
}

// NewInsertTempLogLogic - DIによるlogicの初期化
func newInsertTempLogLogic(repos repository.BodyTemperatureRepositoryInterface) *insertTempLog {
	return &insertTempLog{
		TempLogRepository: repos
	}
}

// ここにロジックを書く
func (logic *insertTempLog) handle(temp *BodyTemperature) (*model.BodyTemperature, error) {
	return logic.TempLogRepository.Insert(temp)
}
