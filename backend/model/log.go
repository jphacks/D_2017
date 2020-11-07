package model

import (
	"errors"
	"time"
)

// Log - logテーブルのカラム
type Log struct {
	ID        int
	UserID    string
	RoomID    int
	EnteredAt *time.Time
	LeftAt    *time.Time
}

// NewLog - InsertするためのNewLogを返却します
func NewLog(userID string, roomID int) (*Log, error) {
	userIDLength := len(userID)

	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}

	return &Log{
		UserID: userID,
		RoomID: roomID,
	}, nil
}
