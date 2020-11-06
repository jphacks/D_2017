package main

import (
	"context"
	"encoding/json"
	"errors"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

type reqBody struct {
	Body_temperature model.BodyTemperature `json:"body_temperature"`
}

// InsertTempLogHandleRequest - リクエストのハンドラ
func InsertTempLogHandleRequest(
	ctx context.Context,
	req events.APIGatewayProxyRequest,
) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	// reqbodyから体温を取得
	var reqbody reqBody
	err := json.Unmarshal([]byte(req.Body), &reqbody)
	if err != nil {
		return events.APIGatewayProxyResponse{}, errors.New("No temp is in request body")
	}
	templog := reqbody.Body_temperature

	// logic呼び出し
	logic := newInsertTempLogLogic(repository.NewBodyTemperatureRepository())
	_, err = logic.handle(idm, userID)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
	}, nil
}

func main() {
	lambda.Start(InsertTempLogHandleRequest)
}
