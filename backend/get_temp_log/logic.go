package main

import (
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
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
func (logic *getTempLogLogic) handle(userID string, offset int, count int) (*response.TempLogResponse, error) {
	logs, err := logic.bodyTemperatureRepository.SelectByUserID(userID, offset, count)
	if err != nil {
		return nil, err
	}

	var res []*response.BodyTemperature
	for _, log := range *logs {
		temp := response.BodyTemperature{
			Temperature:  log.Temperature,
			IsTrusted:    log.IsTrusted,
			MeasuredTime: log.CreatedAt,
		}
		res = append(res, &temp)
	}

	return &response.TempLogResponse{Logs: res}, err
}
