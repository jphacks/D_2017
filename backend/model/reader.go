package model

import "errors"

// Reader - readerテーブルのカラム
type Reader struct {
	MACAddress string
	UserID     string
	RoomID     int
}

// NewReader - readerテーブル挿入用のデータを生成します
func NewReader(macAddress string, userID string, roomID int) (*Reader, error) {
	userIDLength := len(userID)
	macAddressLength := len(macAddress)

	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}
	if macAddressLength <= 0 && macAddressLength > 100 {
		return nil, errors.New("Invalid MACAddress length")
	}

	return &Reader{
		MACAddress: macAddress,
		UserID:     userID,
		RoomID:     roomID,
	}, nil
}
