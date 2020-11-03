package repository

import (
	"time"

	"github.com/jphacks/D_2017/model"
)

const (
	selectLatestQuery = "SELECT id, name, create_at FROM `version` WHERE id = (SELECT MAX(id) FROM `version` as tmp)"
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
	db, err := newDB(getDBInfo())
	if err != nil {
		return nil, err
	}

	var id int
	var name string
	var createdAt time.Time
	if err := db.client.QueryRow(selectLatestQuery).Scan(&id, &name, &createdAt); err != nil {
		return nil, err
	}

	return &model.Version{
		ID:        id,
		Name:      name,
		CreatedAt: &createdAt,
	}, nil
}
