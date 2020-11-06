package response

// UsersInRoomResponse - 入室中のメンバーのレスポンス
type UsersInRoomResponse struct {
	Members []Member `json:"members"`
}
