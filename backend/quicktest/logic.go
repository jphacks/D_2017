package main

import (
	"fmt"

	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

// QuickTestLogic - QuickTestのロジック
type quickTestLogic struct {
	versionRepository repository.VersionRepositoryInterface
}

// NewQuickTestLogic - DIによるlogicの初期化
func newQuickTestLogic(versionRepository repository.VersionRepositoryInterface) *quickTestLogic {
	return &quickTestLogic{
		versionRepository: versionRepository,
	}
}

// ここにロジックを書く
func (logic *quickTestLogic) handle() (*response.QuickTestResponse, error) {
	version, err := logic.versionRepository.SelectLatest()
	if err != nil {
		return nil, err
	}

	return &response.QuickTestResponse{
		Message: fmt.Sprintf("Hello, cers %s(%s)", version.Name, version.CreatedAt),
	}, nil
}
