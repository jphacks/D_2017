package main

import (
	"context"
	"fmt"
	"log"

	"github.com/aws/aws-lambda-go/lambda"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/iot"
)

// Event - 送られてくるjson
type Event struct {
	Timestamp  int64  `json:"timestamp"`
	Idm        string `json:"idm"`
	MacAddress string `json:"mac_address"`
}

func eventHandler(ctx context.Context, event Event) (string, error) {
	/*client := iotdataplane.New(session.Must(session.NewSession()), &aws.Config{
		Endpoint: aws.String("a7xwb0k1wq76j-ats.iot.us-east-2.amazonaws.com"),
		Region:   aws.String("us-east-2"),
	})*/

	sess, err := session.NewSession(aws.NewConfig())
	if err != nil {
		log.Fatal("Failed to create aws session", err)
	}

	fmt.Println("セッションを生成")

	ctrlSvc := iot.New(sess)
	descResp, err := ctrlSvc.DescribeEndpoint(&iot.DescribeEndpointInput{})
	if err != nil {
		log.Fatal("failed to get dataplane endpoint", err)
	}
	fmt.Println(descResp.EndpointAddress)

	fmt.Println("セッションを生成")

	//topic := "entry/result"
	//var qos int64 = 0

	// イベントからデータ取得
	/*unixtime := event.Timestamp
	idm := event.Idm
	macAddress := event.MacAddress

	dummyInput := iotdataplane.PublishInput{
		Topic:   &topic,
		Qos:     &qos,
		Payload: []byte(`{"result":"reject"}`),
	}*/

	fmt.Println("ダミーデータを生成")

	//_, err = client.Publish(&dummyInput)
	fmt.Println("publish完了")
	return "success", err
	/*
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
			return "failed", err
		}
		_, err = client.Publish(&publishInput)
		if err != nil {
			return "failed", err
		}
		return "success", nil*/
}

func main() {
	lambda.Start(eventHandler)
}
