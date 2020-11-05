package model

// Member - memberテーブルのカラム
type Member struct {
	UserID string
	RoomID string
	state  int
}
