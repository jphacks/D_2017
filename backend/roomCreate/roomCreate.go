package main

import (
	"context"
	"encoding/json"
	"errors"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

type RoomInfo struct {
	Name                 string  `json:"name"`
	LimitNumber          int     `json:"limit_number"`
	LimitBodyTemperature float32 `json:"limit_body_temperature"`
	AllowMissing         bool    `json:"allow_missing"`
}

// RoomCreateHandleRequest - 部屋リストのリクエストハンドラ
func RoomCreateHandleRequest(ctx context.Context,
	req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	//reqbodyから作成する部屋情報を取得
	var info RoomInfo
	err := json.Unmarshal([]byte(req.Body), &info)
	if err != nil {
		return events.APIGatewayProxyResponse{}, errors.New("Invalid Body Content")
	}

	// Logic呼び出し
	logic := newRoomCreateLogic(repository.NewAdminRepository(), repository.NewRoomRepository())
	_, _, err = logic.handle(userID, info)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
	}, nil
}

func main() {
	lambda.Start(RoomCreateHandleRequest)
}
