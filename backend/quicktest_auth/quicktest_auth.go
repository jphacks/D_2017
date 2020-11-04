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

// QuickTestAuthHandleRequest - リクエストのハンドラ
func QuickTestAuthHandleRequest(
	ctx context.Context,
	req events.APIGatewayProxyRequest,
) (events.APIGatewayProxyResponse, error) {
	logic := newQuickTestAuthLogic(repository.NewVersionRepository())
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})

	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}

	fmt.Println("[Cognito Debug] claim: ", claims)

	// OIDCでユーザを一意に示す値がsub
	res, err := logic.handle(claims["sub"].(string))
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	body, _ := json.Marshal(res)

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       string(body),
	}, nil
}

func main() {
	lambda.Start(QuickTestAuthHandleRequest)
}
