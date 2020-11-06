package response

// Member - 個別のメンバー
type Member struct {
	UserID string `json:"user_id"`
}

// RoomMemberResponse - 部屋メンバーのレスポンス
type RoomMemberResponse struct {
	Members []Member `json:"members"`
}
