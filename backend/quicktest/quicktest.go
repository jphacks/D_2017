package main

import (
	"encoding/json"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

// QuickTestHandleRequest - リクエストのハンドラ
func QuickTestHandleRequest() (events.APIGatewayProxyResponse, error) {
	logic := newQuickTestLogic(repository.NewVersionRepository())
	res, err := logic.handle()
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
	lambda.Start(QuickTestHandleRequest)
}
