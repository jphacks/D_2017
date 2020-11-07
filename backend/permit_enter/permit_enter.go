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

type reqBody struct {
	IsPermitted bool `json:"is_permitted"`
}

// PermitEnterHandlerRequest - 入室権限許可リクエストハンドラ
func PermitEnterHandlerRequest(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// 認証
	claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{})
	if !ok {
		return events.APIGatewayProxyResponse{}, errors.New("Unauthorized")
	}
	userID := claims["sub"].(string)

	memberID := req.PathParameters["memberId"]
	roomID, err := strconv.Atoi(req.PathParameters["roomId"])
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	var reqbody reqBody
	err = json.Unmarshal([]byte(req.Body), &reqbody)
	if err != nil {
		return events.APIGatewayProxyResponse{}, errors.New("Invalid Body Content")
	}

	isPermitted := reqbody.IsPermitted

	logic := newPermitEnterLogic(repository.NewMemberRepository(), repository.NewAdminRepository())
	res, err := logic.handle(userID, roomID, memberID, isPermitted)
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 500}, err
	}

	if res == nil {
		return events.APIGatewayProxyResponse{StatusCode: 403}, nil
	}

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
	}, nil
}

func main() {
	lambda.Start(PermitEnterHandlerRequest)
}
