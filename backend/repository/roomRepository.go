package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	roomInsert     = "INSERT INTO room(name, limit_number, limit_body_temperature, allow_missing) VALUES(?, ?, ?, ?)"
	roomUpdate     = "UPDATE room SET name = ?, limit_number = ?, limit_body_temperature = ?, allow_missing = ? WHERE id = ?"
	roomSelectByID = "SELECT id, name, limit_number, limit_body_temperature, allow_missing FROM room WHERE id = ?"
)

// RoomRepositoryInterface - roomテーブルにアクセスしするためのインターフェイス
type RoomRepositoryInterface interface {
	Insert(*model.Room) (*model.Room, error)
	Update(*model.Room) (*model.Room, error)
	SelectByID(int) (*model.Room, error)
}

type roomRepository struct {
}

// NewRoomRepository - リポジトリを初期化
func NewRoomRepository() RoomRepositoryInterface {
	return &roomRepository{}
}

// Insert - レコードを1件追加します。IDとIsTrustedは無視されます。
func (repository *roomRepository) Insert(record *model.Room) (*model.Room, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(roomInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	result, err := insert.Exec(record.Name, record.LimitNumber, record.LimitBodyTemperature, record.AllowMissing)
	if err != nil {
		return nil, err
	}

	lastIntertedID, err := result.LastInsertId()
	if err != nil {
		return nil, err
	}

	room, _ := repository.SelectByID(int(lastIntertedID))

	return room, nil
}

// Update - レコードを1件更新します。
func (repository *roomRepository) Update(record *model.Room) (*model.Room, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	update, err := db.client.Prepare(roomUpdate)
	if err != nil {
		return nil, err
	}
	defer update.Close()

	_, err = update.Exec(record.Name, record.LimitNumber, record.LimitBodyTemperature, record.AllowMissing, record.RoomID)
	if err != nil {
		return nil, err
	}

	room, _ := repository.SelectByID(record.RoomID)

	return room, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *roomRepository) SelectByID(id int) (*model.Room, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	room := model.Room{}
	if err := db.client.QueryRow(roomSelectByID, id).Scan(&room.RoomID, &room.Name, &room.LimitNumber, &room.LimitBodyTemperature, &room.AllowMissing); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &room, nil
}
