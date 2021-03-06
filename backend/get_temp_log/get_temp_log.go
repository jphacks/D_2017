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

// GetTempLogHandleRequest - リクエストのハンドラ
func GetTempLogHandleRequest(
	ctx context.Context,
	req events.APIGatewayProxyRequest,
) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	// リクエストからoffsetとcountを取得
	offset, err := strconv.Atoi(req.QueryStringParameters["offset"])
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 400}, err
	}
	count, err := strconv.Atoi(req.QueryStringParameters["count"])
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 400}, err
	}

	// logic呼び出し
	logic := newGetTempLogLogic(repository.NewBodyTemperatureRepository())
	res, err := logic.handle(userID, int(offset), int(count))
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
	lambda.Start(GetTempLogHandleRequest)
}
