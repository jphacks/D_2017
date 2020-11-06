package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	readerInsert             = "INSERT INTO reader(mac_address, user_id, room_id) VALUES(?, ?, ?)"
	readerSelect             = "SELECT mac_address, user_id, room_id FROM reader "
	readerSelectByMACAddress = readerSelect + "WHERE mac_address = ?"
	readerSelectByUserID     = readerSelect + "WHERE user_id = ?"
	readerSelectByRoomID     = readerSelect + "WHERE room_id = ?"
)

// ReaderRepositoryInterface - readerテーブルにアクセスしするためのインターフェイス
type ReaderRepositoryInterface interface {
	Insert(*model.Reader) (*model.Reader, error)
	SelectByMACAddress(string) (*model.Reader, error)
	SelectByUserID(string) (*[]model.Reader, error)
	SelectByRoomID(int) (*[]model.Reader, error)
}

type readerRepository struct {
}

// NewReaderRepository - リポジトリを初期化
func NewReaderRepository() ReaderRepositoryInterface {
	return &readerRepository{}
}

// Insert - レコードを1件追加します。IDとenteredAt,leftAtは無視されます。
func (repository *readerRepository) Insert(record *model.Reader) (*model.Reader, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(readerInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	_, err = insert.Exec(record.MACAddress, record.UserID, record.RoomID)
	if err != nil {
		return nil, err
	}

	return record, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *readerRepository) SelectByMACAddress(macAddress string) (*model.Reader, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	reader := model.Reader{}
	if err := db.client.QueryRow(readerSelectByMACAddress, macAddress).Scan(&reader.MACAddress, &reader.UserID, &reader.RoomID); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &reader, nil
}

// SelectByUserIDAndRoomID - UserIDとRoomIDに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *readerRepository) SelectByUserID(userID string) (*[]model.Reader, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(readerSelectByUserID, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	readerList := []model.Reader{}
	for rows.Next() {
		reader := model.Reader{}
		err = rows.Scan(&reader.MACAddress, &reader.UserID, &reader.RoomID)
		if err != nil {
			return nil, err
		}
		readerList = append(readerList, reader)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &readerList, nil
}

// SelectByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *readerRepository) SelectByRoomID(roomID int) (*[]model.Reader, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(readerSelectByRoomID, roomID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	readerList := []model.Reader{}
	for rows.Next() {
		reader := model.Reader{}
		err = rows.Scan(&reader.MACAddress, &reader.UserID, &reader.RoomID)
		if err != nil {
			return nil, err
		}
		readerList = append(readerList, reader)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &readerList, nil
}
