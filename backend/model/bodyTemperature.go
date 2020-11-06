package model

import (
	"errors"
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

// NewBodyTemperature - InsertするためのBodyTemperatureを返却します
func NewBodyTemperature(userID string, temperature float32, macAddress string) (*BodyTemperature, error) {
	userIDLength := len(userID)
	macAddressLength := len(macAddress)

	// TIPS: 他のモデルでもこの条件を書かないといけないので UserID モデルを作るとなお良い
	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}
	if macAddressLength <= 0 && macAddressLength > 100 {
		return nil, errors.New("Invalid MACAddress length")
	}

	return &BodyTemperature{
		UserID:      userID,
		Temperature: temperature,
		MACAddress:  macAddress,
	}, nil
}
