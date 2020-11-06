package model

import "errors"

// Room - roomテーブルのカラム
type Room struct {
	RoomID               int
	Name                 string
	LimitNumber          int
	LimitBodyTemperature float32
	AllowMissing         bool
}

// NewRoom - roomテーブル挿入用のデータを生成します
func NewRoom(name string, limitNumber int, limitBodyTemperature float32, allowMissing bool) (*Room, error) {
	nameLength := len(name)

	// 文字数制約
	if nameLength <= 0 && nameLength > 100 {
		return nil, errors.New("Invalid Name length")
	}

	return &Room{
		Name:                 name,
		LimitNumber:          limitNumber,
		LimitBodyTemperature: limitBodyTemperature,
		AllowMissing:         allowMissing,
	}, nil
}
