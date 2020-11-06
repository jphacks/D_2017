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

// UsersInRoomHandleRequest - 許可待ちメンバーリストのリクエストハンドラ
func UsersInRoomHandleRequest(ctx context.Context,
	req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// 認証
	_, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	// userID := claims["sub"].(string)

	roomID, err := strconv.Atoi(req.PathParameters["id"])
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	// Logic呼び出し
	logic := newUsersInRoomLogic(repository.NewLogRepository())
	res, err := logic.handle(roomID)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	body, _ := json.Marshal(res)

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       string(body),
	}, nil
}

func main() {
	lambda.Start(UsersInRoomHandleRequest)
}
