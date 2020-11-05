package model

import (
	"time"
)

// BodyTemperature - body temperatureテーブルのカラム
type BodyTemperature struct {
	ID          int
	UserID      string
	Temperature float32
	MACAddress  string
	IsTrusted   bool
	CreatedAt   *time.Time
}
