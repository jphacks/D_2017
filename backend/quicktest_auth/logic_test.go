package main

import (
	"testing"
	"time"

	"github.com/jphacks/D_2017/response"

	"github.com/jphacks/D_2017/repository"

	"github.com/jphacks/D_2017/model"
)

type mockVersionRepository struct {
}

func (versionRepository *mockVersionRepository) SelectLatest() (*model.Version, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	return &model.Version{
		ID:        0,
		Name:      "test_version",
		CreatedAt: &t,
	}, nil
}

func newMockVersionRepository() repository.VersionRepositoryInterface {
	return &mockVersionRepository{}
}

func TestHandle(t *testing.T) {
	logic := newQuickTestAuthLogic(newMockVersionRepository())
	res, err := logic.handle("test_user")
	if err != nil {
		t.Fatal(err)
	}

	expect := response.QuickTestResponse{
		Message: "Hello, cers test_version(2014-12-31 12:13:24 +0000 UTC) with: test_user",
	}

	if res.Message != expect.Message {
		t.Fatalf("Response.Message was not matched. expect: %s, result: %s", res.Message, expect.Message)
	}
}
