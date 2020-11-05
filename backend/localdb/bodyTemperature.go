package main

import (
	"fmt"
	"os"
	"time"

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

	userRepository := repository.NewUserRepository()
	bodyTemperatureRepository := repository.NewBodyTemperatureRepository()

	userID := "TEST_UserID"
	userID2 := "TEST_UserID2"

	// 新規ユーザ作成
	user, _ := model.NewUser(userID)
	user2, _ := model.NewUser(userID2)
	userRepository.Insert(user)
	userRepository.Insert(user2)

	result, _ := bodyTemperatureRepository.Insert(&model.BodyTemperature{
		UserID:      userID,
		Temperature: 36.5,
		MACAddress:  "MACAddress",
	})
	time.Sleep(time.Second)
	bodyTemperatureRepository.Insert(&model.BodyTemperature{
		UserID:      userID,
		Temperature: 36.6,
		MACAddress:  "MACAddress",
	})
	time.Sleep(time.Second)
	bodyTemperatureRepository.Insert(&model.BodyTemperature{
		UserID:      userID2,
		Temperature: 36.5,
		MACAddress:  "MACAddress",
	})

	record, _ := bodyTemperatureRepository.SelectByID(result.ID)
	fmt.Println(record)

	bodyTemperatureRepository.UpdateIsTrustedByID(false, result.ID)

	results, _ := bodyTemperatureRepository.SelectByUserID(userID, 0, 10)
	fmt.Println(results)
	results, _ = bodyTemperatureRepository.SelectByUserID(userID, 0, 1)
	fmt.Println(results)

	results, _ = bodyTemperatureRepository.SelectByUserIDBetween(userID, time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC), time.Now())
	fmt.Println(results)

	// これは空
	results, _ = bodyTemperatureRepository.SelectByUserIDBetween(userID, time.Now(), time.Now())
	fmt.Println(results)
}
