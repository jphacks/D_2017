package repository

import (
	"database/sql"
	"time"

	"github.com/jphacks/D_2017/model"
)

const (
	logInsert                  = "INSERT INTO log(user_id, room_id) VALUES(?, ?)"
	logUpdateLeftAtByID        = "UPDATE log SET left_at = ? WHERE id = ?"
	logSelect                  = "SELECT id, user_id, room_id, entered_at, left_at FROM log "
	logSelectByID              = logSelect + "WHERE id = ?"
	logSelectByUserIDAndRoomID = logSelect + "WHERE user_id = ? AND room_id = ?"
	logSelectByByRoomID        = logSelect + "WHERE room_id = ?"
	logSelectEnteringByRoomID  = logSelect + "WHERE room_id = ? AND left_at IS NULL"
)

// LogRepositoryInterface - logテーブルにアクセスしするためのインターフェイス
type LogRepositoryInterface interface {
	Insert(*model.Log) (*model.Log, error)
	UpdateLeftAtByID(int, time.Time) (*model.Log, error)
	SelectByID(int) (*model.Log, error)
	SelectByUserIDAndRoomID(string, int) (*[]model.Log, error)
	SelectByRoomID(int) (*[]model.Log, error)
	SelectEnteringByRoomID(int) (*[]model.Log, error)
}

type logRepository struct {
}

// NewLogRepository - リポジトリを初期化
func NewLogRepository() LogRepositoryInterface {
	return &logRepository{}
}

// Insert - レコードを1件追加します。IDとenteredAt,leftAtは無視されます。
func (repository *logRepository) Insert(record *model.Log) (*model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(logInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	result, err := insert.Exec(record.UserID, record.RoomID)
	if err != nil {
		return nil, err
	}

	lastIntertedID, err := result.LastInsertId()
	if err != nil {
		return nil, err
	}

	log, _ := repository.SelectByID(int(lastIntertedID))

	return log, nil
}

// UpdateLeftAtByID - レコードのleft_atを1件更新します。
func (repository *logRepository) UpdateLeftAtByID(id int, leftAt time.Time) (*model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	update, err := db.client.Prepare(logUpdateLeftAtByID)
	if err != nil {
		return nil, err
	}
	defer update.Close()

	_, err = update.Exec(leftAt, id)
	if err != nil {
		return nil, err
	}

	log, _ := repository.SelectByID(id)

	return log, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *logRepository) SelectByID(id int) (*model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	log := model.Log{}
	if err := db.client.QueryRow(logSelectByID, id).Scan(&log.ID, &log.UserID, &log.RoomID, &log.EnteredAt, &log.LeftAt); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &log, nil
}

// SelectByUserIDAndRoomID - UserIDとRoomIDに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *logRepository) SelectByUserIDAndRoomID(userID string, roomID int) (*[]model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(logSelectByUserIDAndRoomID, userID, roomID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	logList := []model.Log{}
	for rows.Next() {
		log := model.Log{}
		err = rows.Scan(&log.ID, &log.UserID, &log.RoomID, &log.EnteredAt, &log.LeftAt)
		if err != nil {
			return nil, err
		}
		logList = append(logList, log)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &logList, nil
}

// SelectByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *logRepository) SelectByRoomID(roomID int) (*[]model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(logSelectByByRoomID, roomID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	logList := []model.Log{}
	for rows.Next() {
		log := model.Log{}
		err = rows.Scan(&log.ID, &log.UserID, &log.RoomID, &log.EnteredAt, &log.LeftAt)
		if err != nil {
			return nil, err
		}
		logList = append(logList, log)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &logList, nil
}

// SelectEnteringByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *logRepository) SelectEnteringByRoomID(roomID int) (*[]model.Log, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(logSelectEnteringByRoomID, roomID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	logList := []model.Log{}
	for rows.Next() {
		log := model.Log{}
		err = rows.Scan(&log.ID, &log.UserID, &log.RoomID, &log.EnteredAt, &log.LeftAt)
		if err != nil {
			return nil, err
		}
		logList = append(logList, log)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &logList, nil
}
