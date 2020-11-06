package model

import (
	"errors"

	"github.com/jphacks/D_2017/enum"
)

// Member - memberテーブルのカラム
type Member struct {
	UserID string
	RoomID int
	State  int
}

// NewMember - memberテーブル挿入用のデータを生成します
func NewMember(userID string, roomID int) (*Member, error) {
	userIDLength := len(userID)

	// 文字数制約
	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}

	return &Member{
		UserID: userID,
		RoomID: roomID,
		State:  enum.PENDING,
	}, nil
}
