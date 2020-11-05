package repository

import (
	"database/sql"
	"time"

	"github.com/jphacks/D_2017/model"
)

const (
	bodyTemperatureInsert                = "INSERT INTO body_temperature(user_id, temperature, mac_address) VALUES(?, ?, ?)"
	bodyTemperatureUpdateIsTrustedByID   = "UPDATE body_temperature SET is_trusted = ? WHERE id = ?"
	bodyTemperatureSelectByID            = "SELECT id, user_id, temperature, mac_address, is_trusted, created_at FROM body_temperature WHERE id = ?"
	bodyTemperatureSelectByUserID        = "SELECT id, user_id, temperature, mac_address, is_trusted, created_at FROM body_temperature WHERE user_id = ? ORDER BY id DESC LIMIT ? OFFSET ?"
	bodyTemperatureSelectByUserIDBetween = "SELECT id, user_id, temperature, mac_address, is_trusted, created_at FROM body_temperature WHERE user_id = ? AND created_at BETWEEN ? AND ? ORDER BY id DESC"
)

// BodyTemperatureRepositoryInterface - body_temperatureテーブルにアクセスしするためのインターフェイス
type BodyTemperatureRepositoryInterface interface {
	Insert(*model.BodyTemperature) (*model.BodyTemperature, error)
	UpdateIsTrustedByID(bool, int) (*model.BodyTemperature, error)
	SelectByID(int) (*model.BodyTemperature, error)
	SelectByUserID(string, int, int) (*[]model.BodyTemperature, error)
	SelectByUserIDBetween(string, time.Time, time.Time) (*[]model.BodyTemperature, error)
}

type bodyTemperatureRepository struct {
}

// NewBodyTemperatureRepository - リポジトリを初期化
func NewBodyTemperatureRepository() BodyTemperatureRepositoryInterface {
	return &bodyTemperatureRepository{}
}

// Insert - レコードを1件追加します。IDとIsTrustedは無視されます。
func (repository *bodyTemperatureRepository) Insert(record *model.BodyTemperature) (*model.BodyTemperature, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(bodyTemperatureInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	result, err := insert.Exec(record.UserID, record.Temperature, record.MACAddress)
	if err != nil {
		return nil, err
	}

	lastIntertedID, err := result.LastInsertId()
	if err != nil {
		return nil, err
	}

	bodyTemperature, _ := repository.SelectByID(int(lastIntertedID))

	return bodyTemperature, nil
}

// UpdateIsTrustedByID - レコードを1件削除します。
func (repository *bodyTemperatureRepository) UpdateIsTrustedByID(isTrusted bool, id int) (*model.BodyTemperature, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	update, err := db.client.Prepare(bodyTemperatureUpdateIsTrustedByID)
	if err != nil {
		return nil, err
	}
	defer update.Close()

	_, err = update.Exec(isTrusted, id)
	if err != nil {
		return nil, err
	}

	bodyTemperature, _ := repository.SelectByID(id)

	return bodyTemperature, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *bodyTemperatureRepository) SelectByID(id int) (*model.BodyTemperature, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	bodyTemperature := model.BodyTemperature{}
	if err := db.client.QueryRow(bodyTemperatureSelectByID, id).Scan(&bodyTemperature.ID, &bodyTemperature.UserID, &bodyTemperature.Temperature, &bodyTemperature.MACAddress, &bodyTemperature.IsTrusted, &bodyTemperature.CreatedAt); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &bodyTemperature, nil
}

// SelectByUserID - UserIdに一致するレコードを取得します。見つからない場合はからの配列が返却されます。
func (repository *bodyTemperatureRepository) SelectByUserID(userID string, offset int, limit int) (*[]model.BodyTemperature, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(bodyTemperatureSelectByUserID, userID, limit, offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	bodyTemperatureList := []model.BodyTemperature{}
	for rows.Next() {
		bodyTemperature := model.BodyTemperature{}
		err = rows.Scan(&bodyTemperature.ID, &bodyTemperature.UserID, &bodyTemperature.Temperature, &bodyTemperature.MACAddress, &bodyTemperature.IsTrusted, &bodyTemperature.CreatedAt)
		if err != nil {
			return nil, err
		}
		bodyTemperatureList = append(bodyTemperatureList, bodyTemperature)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &bodyTemperatureList, nil
}

// SelectByUserIDBetween - UserIdに一致するレコードを取得します。見つからない場合はからの配列が返却されます。
func (repository *bodyTemperatureRepository) SelectByUserIDBetween(userID string, since time.Time, until time.Time) (*[]model.BodyTemperature, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(bodyTemperatureSelectByUserIDBetween, userID, since, until)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	bodyTemperatureList := []model.BodyTemperature{}
	for rows.Next() {
		bodyTemperature := model.BodyTemperature{}
		err = rows.Scan(&bodyTemperature.ID, &bodyTemperature.UserID, &bodyTemperature.Temperature, &bodyTemperature.MACAddress, &bodyTemperature.IsTrusted, &bodyTemperature.CreatedAt)
		if err != nil {
			return nil, err
		}
		bodyTemperatureList = append(bodyTemperatureList, bodyTemperature)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &bodyTemperatureList, nil
}
