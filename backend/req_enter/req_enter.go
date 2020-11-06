package main

import (
	"context"
	"errors"
	"strconv"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

func ReqEnterHandlerRequest(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	roomID, err := strconv.Atoi(req.PathParameters["id"])
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	logic := newReqEnterLogic(repository.NewMemberRepository())
	_, err = logic.handle(userID, roomID)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
	}, nil
}

func main() {
	lambda.Start(ReqEnterHandlerRequest)
}
