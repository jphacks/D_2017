package model

import (
	"time"
)

// Version - versionテーブルのカラム
type Version struct {
	ID        int
	Name      string
	CreatedAt *time.Time
}
