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

	repository := repository.NewCardRepository()

	IDm := "TEST_IDm"

	_, err := repository.Insert(&model.Card{
		IDm:    IDm,
		UserID: "TEST_UserID",
	})

	if err != nil {
		fmt.Println(err)
	}

	record, err := repository.SelectByIDm(IDm)
	fmt.Println(record)

	if err != nil {
		fmt.Println(err)
	}

	repository.DeleteByIDm(IDm)

	// ここはnilになるはず
	record, _ = repository.SelectByIDm(IDm)
	fmt.Println(record)
}
