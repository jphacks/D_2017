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

func TestHandle(t *testing.T) {
	logic := newRegisterIdmLogic(newMockCardRepository())
	res, err := logic.handle("I am IDm", "test_user")
	if err != nil {
		t.Fatal(err)
	}

	expect := model.Card{
		IDm:    "I am IDm",
		UserID: "test_user",
	}

	if res.IDm != expect.IDm {
		t.Fatalf("Response.IDm was not matched. expect: %s, result: %s", res.IDm, expect.IDm)
	}
	if res.UserID != expect.UserID {
		t.Fatalf("Response.UserID was not matched. expect: %s, result: %s", res.UserID, expect.UserID)
	}
}
