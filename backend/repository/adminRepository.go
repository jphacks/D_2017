package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	adminInsert                  = "INSERT INTO admin(user_id, room_id) VALUES(?, ?)"
	adminSelect                  = "SELECT user_id, room_id FROM admin "
	adminSelectByUserIDAndRoomID = adminSelect + "WHERE user_id = ? AND room_id = ?"
	adminSelectByUserID          = adminSelect + "WHERE user_id = ?"
	adminSelectByRoomID          = adminSelect + "WHERE room_id = ?"
	adminDeleteByUserIDAndRoomID = "DELETE FROM admin WHERE user_id = ? AND room_id = ?"
)

// AdminRepositoryInterface - adminテーブルにアクセスしするためのインターフェイス
type AdminRepositoryInterface interface {
	Insert(*model.Admin) (*model.Admin, error)
	SelectByUserIDAndRoomID(string, int) (*model.Admin, error)
	SelectByUserID(string) (*[]model.Admin, error)
	SelectByRoomID(int) (*[]model.Admin, error)
	DeleteByUserIDAndRoomID(string, int) error
}

type adminRepository struct {
}

// NewAdminRepository - リポジトリを初期化
func NewAdminRepository() AdminRepositoryInterface {
	return &adminRepository{}
}

// Insert - レコードを1件追加します。IDとenteredAt,leftAtは無視されます。
func (repository *adminRepository) Insert(record *model.Admin) (*model.Admin, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(adminInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	_, err = insert.Exec(record.UserID, record.RoomID)
	if err != nil {
		return nil, err
	}

	return record, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *adminRepository) SelectByUserIDAndRoomID(userID string, roomID int) (*model.Admin, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	admin := model.Admin{}
	if err := db.client.QueryRow(adminSelectByUserIDAndRoomID, userID, roomID).Scan(&admin.UserID, &admin.RoomID); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &admin, nil
}

// SelectByUserIDAndRoomID - UserIDとRoomIDに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *adminRepository) SelectByUserID(userID string) (*[]model.Admin, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(adminSelectByUserID, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	adminList := []model.Admin{}
	for rows.Next() {
		admin := model.Admin{}
		err = rows.Scan(&admin.UserID, &admin.RoomID)
		if err != nil {
			return nil, err
		}
		adminList = append(adminList, admin)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &adminList, nil
}

// SelectByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *adminRepository) SelectByRoomID(roomID int) (*[]model.Admin, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(adminSelectByRoomID, roomID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	adminList := []model.Admin{}
	for rows.Next() {
		admin := model.Admin{}
		err = rows.Scan(&admin.UserID, &admin.RoomID)
		if err != nil {
			return nil, err
		}
		adminList = append(adminList, admin)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &adminList, nil
}

// SelectEnteringByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *adminRepository) DeleteByUserIDAndRoomID(userID string, roomID int) error {
	db, err := newDB(getDBInfo())
	if err != nil {
		return err
	}

	delete, err := db.client.Prepare(adminDeleteByUserIDAndRoomID)
	if err != nil {
		return err
	}
	defer delete.Close()

	_, err = delete.Exec(userID, roomID)
	if err != nil {
		return err
	}

	return nil
}
