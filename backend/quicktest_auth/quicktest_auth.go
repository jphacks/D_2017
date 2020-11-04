package main

import (
	"context"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-lambda-go/lambdacontext"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

// QuickTestAuthHandleRequest - リクエストのハンドラ
func QuickTestAuthHandleRequest(ctx context.Context) (response.QuickTestResponse, error) {
	logic := newQuickTestAuthLogic(repository.NewVersionRepository())
	lc, _ := lambdacontext.FromContext(ctx)
	res, err := logic.handle(lc.Identity.CognitoIdentityID)
	if err != nil {
		return response.QuickTestResponse{}, err
	}

	return *res, nil
}

func main() {
	lambda.Start(QuickTestAuthHandleRequest)
}
