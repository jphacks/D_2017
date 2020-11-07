package main

import (
	"context"
	"encoding/json"
	"errors"
	"strconv"

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

// RoomUpdateHandleRequest - 部屋リストのリクエストハンドラ
func RoomUpdateHandleRequest(ctx context.Context,
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

	roomID, err := strconv.Atoi(req.PathParameters["id"])
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	// Logic呼び出し
	logic := newRoomUpdateLogic(repository.NewRoomRepository())
	_, err = logic.handle(userID, roomID, info)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 204,
	}, nil
}

func main() {
	lambda.Start(RoomUpdateHandleRequest)
}
