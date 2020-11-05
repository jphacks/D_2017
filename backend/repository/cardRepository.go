package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	cardInsert      = "INSERT INTO card(idm, user_id) VALUES(?, ?)"
	cardDeleteByIDm = "DELETE FROM card WHERE idm = ?"
	cardSelectByIDm = "SELECT idm, user_id FROM card WHERE idm = ?"
)

// CardRepositoryInterface - cardテーブルにアクセスしするためのインターフェイス
type CardRepositoryInterface interface {
	Insert(*model.Card) (*model.Card, error)
	DeleteByIDm(string) error
	SelectByIDm(string) (*model.Card, error)
}

type cardRepository struct {
}

// NewCardRepository - リポジトリを初期化
func NewCardRepository() CardRepositoryInterface {
	return &cardRepository{}
}

// Insert - レコードを1件追加します。
func (repository *cardRepository) Insert(record *model.Card) (*model.Card, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(cardInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	_, err = insert.Exec(record.IDm, record.UserID)
	if err != nil {
		return nil, err
	}

	return record, nil
}

// DeleteByIDm - レコードを1件削除します。
func (repository *cardRepository) DeleteByIDm(IDm string) error {
	db, err := newDB(getDBInfo())
	if err != nil {
		return err
	}

	delete, err := db.client.Prepare(cardDeleteByIDm)
	if err != nil {
		return err
	}
	defer delete.Close()

	_, err = delete.Exec(IDm)
	if err != nil {
		return err
	}

	return nil
}

// DeleteByIDm - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *cardRepository) SelectByIDm(IDm string) (*model.Card, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	card := model.Card{}
	if err := db.client.QueryRow(cardSelectByIDm, IDm).Scan(&card.IDm, &card.UserID); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &card, nil
}
