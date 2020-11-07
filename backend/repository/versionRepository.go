package repository

import (
	"fmt"
	"time"

	"github.com/jphacks/D_2017/model"
)

const (
	versionSelectLatest = "SELECT id, name, created_at FROM `version` WHERE id = (SELECT MAX(id) FROM `version` as tmp)"
)

// VersionRepositoryInterface - versionテーブルにアクセスしするためのインターフェイス
type VersionRepositoryInterface interface {
	SelectLatest() (*model.Version, error)
}

// VersionRepository - 実際にDBにアクセスするリポジトリ
type versionRepository struct {
}

// NewVersionRepository - リポジトリを初期化
func NewVersionRepository() VersionRepositoryInterface {
	return &versionRepository{}
}

// SelectLatest - 一番新しいバージョン情報を取得します
func (repository *versionRepository) SelectLatest() (*model.Version, error) {
	fmt.Println("[SQL Debug] DB接続開始")
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}
	fmt.Println("[SQL Debug] DB接続成功")

	var id int
	var name string
	var createdAt time.Time
	fmt.Println("[SQL Debug] SQL発行開始")
	if err := db.client.QueryRow(versionSelectLatest).Scan(&id, &name, &createdAt); err != nil {
		return nil, err
	}
	fmt.Println("[SQL Debug] SQL発行完了")

	return &model.Version{
		ID:        id,
		Name:      name,
		CreatedAt: &createdAt,
	}, nil
}
