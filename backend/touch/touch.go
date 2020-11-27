package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/iotdataplane"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

// Event - 送られてくるjson
type Event struct {
	Timestamp  int64  `json:"timestamp"`
	Idm        string `json:"idm"`
	MacAddress string `json:"mac_address"`
}

func eventHandler(ctx context.Context, event Event) (string, error) {
	client := iotdataplane.New(session.Must(session.NewSession()), &aws.Config{
		Endpoint: aws.String("a7xwb0k1wq76j-ats.iot.us-east-2.amazonaws.com"),
		Region:   aws.String("us-east-2"),
	})

	topic := "entry/result"
	var qos int64 = 0

	// イベントからデータ取得
	unixtime := event.Timestamp
	idm := event.Idm
	fmt.Println(idm)
	macAddress := event.MacAddress

	logic := newTouchLogic(repository.NewLogRepository(),
		repository.NewReaderRepository(),
		repository.NewCardRepository(),
		repository.NewRoomRepository(),
		repository.NewBodyTemperatureRepository())

	payload, err := logic.handle(unixtime, idm, macAddress)
	publishInput := iotdataplane.PublishInput{
		Topic:   &topic,
		Qos:     &qos,
		Payload: []byte(payload),
	}
	if err != nil {
		publishInput.Payload = []byte(`{"result":"reject"}`)
		client.Publish(&publishInput)
		fmt.Println(err)
		return "failed", err
	}
	_, err = client.Publish(&publishInput)
	if err != nil {
		return "failed", err
	}
	return "success", nil
}

func main() {
	lambda.Start(eventHandler)
}
