package main

import (
	"fmt"

	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

// QuickTestLogic - QuickTestのロジック
type quickTestAuthLogic struct {
	versionRepository repository.VersionRepositoryInterface
}

// NewQuickTestLogic - DIによるlogicの初期化
func newQuickTestAuthLogic(versionRepository repository.VersionRepositoryInterface) *quickTestAuthLogic {
	return &quickTestAuthLogic{
		versionRepository: versionRepository,
	}
}

// ここにロジックを書く
func (logic *quickTestAuthLogic) handle(userID string) (*response.QuickTestResponse, error) {
	version, err := logic.versionRepository.SelectLatest()
	if err != nil {
		return nil, err
	}

	fmt.Println("UserID: " + userID)

	return &response.QuickTestResponse{
		Message: fmt.Sprintf("Hello, cers %s(%s) with: %s", version.Name, version.CreatedAt, userID),
	}, nil
}
