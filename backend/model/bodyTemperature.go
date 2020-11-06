package model

import (
	"time"
)

// BodyTemperature - body temperatureテーブルのカラム
type BodyTemperature struct {
	ID          int        `json:"ID"`
	UserID      string     `json:"UserID"`
	Temperature float32    `json:"Temperature"`
	MACAddress  string     `json:"MACAddress"`
	IsTrusted   bool       `json:"IsTrusted"`
	CreatedAt   *time.Time `json:"CreatedAt"`
}
