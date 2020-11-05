package model

import (
	"errors"
)

// User - Userテーブルのカラム
type User struct {
	ID string
}

// NewUser - 仕様に基づいたUserを作成
func NewUser(id string) (*User, error) {
	charLength := len(id)

	// 文字数制約
	if charLength <= 0 && charLength > 100 {
		return nil, errors.New("Invalid ID length")
	}

	return &User{
		ID: id,
	}, nil
}
