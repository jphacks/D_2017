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

	userRepository := repository.NewUserRepository()
	cardRepository := repository.NewCardRepository()

	idm := "TEST_IDm"
	userID := "TEST_UserID"

	// 新規ユーザ作成
	user, _ := model.NewUser(userID)
	userRepository.Insert(user)

	_, err := cardRepository.Insert(&model.Card{
		IDm:    idm,
		UserID: userID,
	})

	if err != nil {
		fmt.Println(err)
	}

	record, err := cardRepository.SelectByIDm(idm)
	fmt.Println(record)

	if err != nil {
		fmt.Println(err)
	}

	cardRepository.DeleteByIDm(idm)

	// ここはnilになるはず
	record, _ = cardRepository.SelectByIDm(idm)
	fmt.Println(record)
}
