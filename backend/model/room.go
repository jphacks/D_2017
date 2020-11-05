package model

// Room - roomテーブルのカラム
type Room struct {
	RoomID               int
	Name                 string
	LimitNumber          int
	LimitBodyTemperature int
	AllowMissing         bool
}
