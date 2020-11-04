package repository

import (
	"database/sql"
	"fmt"
)

type db struct {
	client *sql.DB
}

func newDB(info *dbInfo) (*db, error) {
	option := "charset=utf8&parseTime=true"
	dataSourceConfig := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?%s",
		info.user, info.password, info.endpoint, info.port, info.name, option)

	fmt.Println("Connection config: " + dataSourceConfig)

	client, err := sql.Open("mysql", dataSourceConfig)
	if err != nil {
		return nil, err
	}

	return &db{
		client: client,
	}, nil
}
