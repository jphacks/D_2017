package main

import (
	"fmt"
	"os"

	"github.com/jphacks/D_2017/model"

	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

func main() {
	os.Setenv("user", "local_user")    // DBに作成したユーザ名
	os.Setenv("password", "password")  // パスワード
	os.Setenv("endpoint", "localhost") // RDS Proxyのプロキシエンドポイント
	os.Setenv("name", "local")         // テーブルを作ったDB名
	os.Setenv("port", "3306")          // DBのポート

	roomRepository := repository.NewRoomRepository()

	result, _ := roomRepository.Insert(&model.Room{
		Name:                 "TEST_Name",
		LimitNumber:          10,
		LimitBodyTemperature: 36.5,
		AllowMissing:         false,
	})

	record, _ := roomRepository.SelectByID(result.RoomID)
	fmt.Println(record)

	record.AllowMissing = true
	record.LimitNumber = 10
	record.LimitBodyTemperature = 37.0
	record.Name = "TEST_Name2"

	roomRepository.Update(record)

	record, _ = roomRepository.SelectByID(result.RoomID)
	fmt.Println(record)
}
