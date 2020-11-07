package repository

import (
	"database/sql"

	"github.com/jphacks/D_2017/model"
)

const (
	memberInsert                  = "INSERT INTO member(user_id, room_id, state) VALUES(?, ?, ?)"
	memberUpdate                  = "UPDATE member SET state = ? WHERE user_id = ? AND room_id = ?"
	memberSelect                  = "SELECT user_id, room_id, state FROM member "
	memberSelectByUserIDAndRoomID = memberSelect + "WHERE user_id = ? AND room_id = ?"
	memberSelectByUserID          = memberSelect + "WHERE user_id = ?"
	memberSelectByRoomIDAndState  = memberSelect + "WHERE room_id = ? AND state = ?"
)

// MemberRepositoryInterface - memberテーブルにアクセスしするためのインターフェイス
type MemberRepositoryInterface interface {
	Insert(*model.Member) (*model.Member, error)
	Update(*model.Member) (*model.Member, error)
	SelectByUserIDAndRoomID(string, int) (*model.Member, error)
	SelectByUserID(string) (*[]model.Member, error)
	SelectByRoomIDAndState(int, int) (*[]model.Member, error)
}

type memberRepository struct {
}

// NewMemberRepository - リポジトリを初期化
func NewMemberRepository() MemberRepositoryInterface {
	return &memberRepository{}
}

// Insert - レコードを1件追加します。IDとenteredAt,leftAtは無視されます。
func (repository *memberRepository) Insert(record *model.Member) (*model.Member, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	insert, err := db.client.Prepare(memberInsert)
	if err != nil {
		return nil, err
	}
	defer insert.Close()

	_, err = insert.Exec(record.UserID, record.RoomID, record.State)
	if err != nil {
		return nil, err
	}

	return record, nil
}

func (repository *memberRepository) Update(record *model.Member) (*model.Member, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	update, err := db.client.Prepare(memberUpdate)
	if err != nil {
		return nil, err
	}
	defer update.Close()

	_, err = update.Exec(record.State, record.UserID, record.RoomID)
	if err != nil {
		return nil, err
	}

	room, _ := repository.SelectByUserIDAndRoomID(record.UserID, record.RoomID)

	return room, nil
}

// SelectByID - レコードを1件取得します。見つからない場合はnilが返却されます。
func (repository *memberRepository) SelectByUserIDAndRoomID(userID string, roomID int) (*model.Member, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	member := model.Member{}
	if err := db.client.QueryRow(memberSelectByUserIDAndRoomID, userID, roomID).Scan(&member.UserID, &member.RoomID, &member.State); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &member, nil
}

// SelectByUserIDAndRoomID - UserIDとRoomIDに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *memberRepository) SelectByUserID(userID string) (*[]model.Member, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(memberSelectByUserID, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	memberList := []model.Member{}
	for rows.Next() {
		member := model.Member{}
		err = rows.Scan(&member.UserID, &member.RoomID, &member.State)
		if err != nil {
			return nil, err
		}
		memberList = append(memberList, member)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &memberList, nil
}

// SelectByRoomID - RoomIdに一致するレコードを取得します。見つからない場合は空の配列が返却されます。
func (repository *memberRepository) SelectByRoomIDAndState(roomID int, state int) (*[]model.Member, error) {
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	rows, err := db.client.Query(memberSelectByRoomIDAndState, roomID, state)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	memberList := []model.Member{}
	for rows.Next() {
		member := model.Member{}
		err = rows.Scan(&member.UserID, &member.RoomID, &member.State)
		if err != nil {
			return nil, err
		}
		memberList = append(memberList, member)
	}

	if err := rows.Err(); err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &memberList, nil
}
