package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	userInsert     = "INSERT INTO user (id) VALUES (?)"
	userSelectByID = "SELECT id FROM user WHERE id = ?"
)

// UserRepositoryInterface - userテーブルにアクセスしするためのインターフェイス
type UserRepositoryInterface interface {
	Insert(record *model.User) (*model.User, error)
	SelectByID(id string) (*model.User, error)
}

// userRepository - 実際にDBにアクセスするリポジトリ
type userRepository struct {
}

// NewUserRepository - リポジトリを初期化
func NewUserRepository() UserRepositoryInterface {
	return &userRepository{}
}

// Insert - 1件DBに挿入
func (repository *userRepository) Insert(record *model.User) (*model.User, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(userInsert)
	defer insert.Close()
	if err != nil {
		return nil, err
	}

	_, err = insert.Exec(record.ID)
	if err != nil {
		return nil, err
	}

	return record, nil
}

// SelectByID - 1件DBから取得該当レコードがない場合はnilを返却
func (repository *userRepository) SelectByID(id string) (*model.User, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	var resultID string
	if err := db.client.QueryRow(userSelectByID).Scan(&resultID); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &model.User{
		ID: resultID,
	}, nil
}
