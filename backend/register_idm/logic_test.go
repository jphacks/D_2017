package main

import (
	"testing"

	"github.com/jphacks/D_2017/repository"

	"github.com/jphacks/D_2017/model"
)

type mockCardRepository struct {
}

func (cardRepository *mockCardRepository) Insert(record *model.Card) (*model.Card, error) {
	return record, nil
}

func (cardRepository *mockCardRepository) DeleteByIDm(IDm string) error {
	return nil
}

func (cardRepository *mockCardRepository) SelectByIDm(IDm string) (*model.Card, error) {
	return nil, nil
}

func newMockCardRepository() repository.CardRepositoryInterface {
	return &mockCardRepository{}
}

type mockUserRepository struct{}

func newMockUserRepository() repository.UserRepositoryInterface {
	return &mockUserRepository{}
}
func (r *mockUserRepository) Insert(*model.User) (*model.User, error) {
	return &model.User{
		ID: "test-user",
	}, nil
}
func (r *mockUserRepository) SelectByID(id string) (*model.User, error) {
	return nil, nil
}

func TestHandle(t *testing.T) {
	logic := newRegisterIdmLogic(newMockCardRepository(), newMockUserRepository())
	res, err := logic.handle("0000000000000000", "test_user")
	if err != nil {
		t.Fatal(err)
	}

	expect := model.Card{
		IDm:    "0000000000000000",
		UserID: "test_user",
	}

	if res.IDm != expect.IDm {
		t.Fatalf("Response.IDm was not matched. expect: %s, result: %s", res.IDm, expect.IDm)
	}
	if res.UserID != expect.UserID {
		t.Fatalf("Response.UserID was not matched. expect: %s, result: %s", res.UserID, expect.UserID)
	}
}
