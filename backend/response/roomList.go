package response

// Room -
type Room struct {
	RoomID               int     `json:"room_id"`
	Name                 string  `json:"name"`
	LimitNumber          int     `json:"limit_number"`
	LimitBodyTemperature float32 `json:"limit_body_temperature"`
	AllowMissing         bool    `json:"allow_missing"`
}

// RoomListResponse - 管理中の部屋リストのレスポンス
type RoomListResponse struct {
	Rooms []*Room `json:"rooms"`
}
