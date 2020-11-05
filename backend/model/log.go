package model

import (
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
