package response

// memberはroom_members.goで定義済み

// PendingMemberResponse - 部屋メンバーのレスポンス
type PendingMemberResponse struct {
	Members []Member `json:"members"`
}
