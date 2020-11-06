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

// ShowRoomListHandleRequest - 部屋リストのリクエストハンドラ
func ShowRoomListHandleRequest(ctx context.Context,
	req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	// Logic呼び出し
	logic := newRoomListLogic(repository.NewAdminRepository(), repository.NewRoomRepository())
	res, err := logic.handle(userID)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	// body生成
	body, err := json.Marshal(res)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       string(body),
	}, nil
}

func main() {
	lambda.Start(ShowRoomListHandleRequest)
}
