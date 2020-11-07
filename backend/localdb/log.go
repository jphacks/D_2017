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
	roomRepository := repository.NewRoomRepository()
	logRepository := repository.NewLogRepository()

	userID := "TEST_UserID"
	userID2 := "TEST_UserID2"

	// 新規ユーザ作成
	user, _ := model.NewUser(userID)
	user2, _ := model.NewUser(userID2)
	userRepository.Insert(user)
	userRepository.Insert(user2)

	room, _ := roomRepository.Insert(&model.Room{
		Name:                 "TEST_Room",
		LimitNumber:          10,
		LimitBodyTemperature: 37.0,
		AllowMissing:         false,
	})

	result, _ := logRepository.Insert(&model.Log{
		UserID: userID,
		RoomID: room.RoomID,
	})
	logRepository.Insert(&model.Log{
		UserID: userID,
		RoomID: room.RoomID,
	})
	logRepository.Insert(&model.Log{
		UserID: userID2,
		RoomID: room.RoomID,
	})
	fmt.Println(result)

	result, _ = logRepository.UpdateLeftAtByID(result.ID, time.Now())
	fmt.Println(result)

	results, _ := logRepository.SelectByUserIDAndRoomID(userID, room.RoomID)
	fmt.Println(results)

	results, _ = logRepository.SelectByRoomID(room.RoomID)
	fmt.Println(results)

	results, _ = logRepository.SelectEnteringByRoomID(room.RoomID)
	fmt.Println(results)
}
