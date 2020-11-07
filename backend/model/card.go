package model

import "errors"

// Card - cardテーブルのカラム
type Card struct {
	IDm    string
	UserID string
}

// NewCard - cardテーブル挿入用のデータを生成します
func NewCard(idm string, userID string) (*Card, error) {
	idmLength := len(idm)
	userIDLength := len(userID)

	if idmLength != 16 {
		return nil, errors.New("Invalid IDm length")
	}

	if userIDLength <= 0 && userIDLength > 100 {
		return nil, errors.New("Invalid UserID length")
	}

	return &Card{
		IDm:    idm,
		UserID: userID,
	}, nil
}
