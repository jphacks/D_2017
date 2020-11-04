package repository

import (
	"os"
)

// dbInfo - DB接続のための情報
type dbInfo struct {
	user     string
	password string
	endpoint string
	name     string
	port     string
}

// getDBInfo - DB情報を格納して返却します
func getDBInfo() *dbInfo {
	user := os.Getenv("user")         // DBに作成したユーザ名
	password := os.Getenv("password") // パスワード
	endpoint := os.Getenv("endpoint") // RDS Proxyのプロキシエンドポイント
	name := os.Getenv("name")         // テーブルを作ったDB名
	port := os.Getenv("port")         // DBのポート

	return &dbInfo{
		user:     user,
		password: password,
		endpoint: endpoint,
		name:     name,
		port:     port,
	}
}
