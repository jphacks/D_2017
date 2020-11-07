package main

import (
	"context"
	"log"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/jphacks/D_2017/repository"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

// Event - 送られてくるjson
type Event struct {
	Timestamp  string `json:"timestamp"`
	Idm        string `json:"idm"`
	MacAddress string `json:"mac_address"`
}

func eventHandler(ctx context.Context, event Event) (string, error) {
	// イベントからデータ取得
	unixtime := event.Timestamp
	idm := event.Idm
	macAddress := event.MacAddress

	// mqtt初期化処理
	client := mqtt.NewClient(mqtt.NewClientOptions())
	if token := client.Connect(); token.Wait() && token.Error() != nil {
		log.Fatalf("Mqtt error: %s", token.Error())
	}

	logic := newTouchLogic(repository.NewLogRepository(),
		repository.NewReaderRepository(),
		repository.NewCardRepository(),
		repository.NewRoomRepository(),
		repository.NewBodyTemperatureRepository())

	payload, err := logic.handle(unixtime, idm, macAddress)
	if err != nil {
		client.Publish("iot-data", 0, false, `{"result":"reject"}`)
		return "failed", err
	}
	client.Publish("iot-data", 0, false, payload)
	return "success", nil
}

func main() {
	lambda.Start(eventHandler)
}
