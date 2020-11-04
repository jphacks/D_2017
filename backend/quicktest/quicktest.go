package main

import (
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

// QuickTestHandleRequest - リクエストのハンドラ
func QuickTestHandleRequest() (response.QuickTestResponse, error) {
	logic := newQuickTestLogic(repository.NewVersionRepository())
	res, err := logic.handle()
	if err != nil {
		return response.QuickTestResponse{}, err
	}

	return *res, nil
}

func main() {
	lambda.Start(QuickTestHandleRequest)
}
