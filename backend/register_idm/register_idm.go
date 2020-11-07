package main

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

type reqBody struct {
	IDm string `json:"IDm"`
}

// RegisterIDmHandleRequest - リクエストのハンドラ
func RegisterIDmHandleRequest(
	ctx context.Context,
	req events.APIGatewayProxyRequest,
) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	fmt.Println(req.Body)

	// reqbodyからIDmを取得
	var reqbody reqBody
	err := json.Unmarshal([]byte(req.Body), &reqbody)
	if err != nil {
		return events.APIGatewayProxyResponse{}, errors.New("No IDm is in request body")
	}
	idm := reqbody.IDm

	// logic呼び出し
	logic := newRegisterIdmLogic(repository.NewCardRepository(), repository.NewUserRepository())
	_, err = logic.handle(idm, userID)
	if err != nil {
		fmt.Println("Error in cardRepository.Insert")
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
	}, nil
}

func main() {
	lambda.Start(RegisterIDmHandleRequest)
}
