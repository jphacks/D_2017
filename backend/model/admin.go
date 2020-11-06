package model

import "errors"

// Admin - adminテーブルのカラム
type Admin struct {
	UserID string
	RoomID int
}

// NewAdmin - adminテーブル挿入用のデータを生成します
func NewAdmin(userID string, roomID int) (*Admin, error) {
	userIDLength := len(userID)

	// 文字数制約
	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}

	return &Admin{
		UserID: userID,
		RoomID: roomID,
	}, nil
}
