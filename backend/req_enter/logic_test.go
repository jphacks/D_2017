package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type mockMemberRepository struct{}

func newMockMemberRepository() repository.MemberRepositoryInterface {
	return &mockMemberRepository{}
}

func (m *mockMemberRepository) Insert(*model.Member) (*model.Member, error) {
	return &model.Member{
		UserID: "test-user",
		RoomID: 42,
		State:  enum.PENDING,
	}, nil
}
func (m *mockMemberRepository) Update(*model.Member) (*model.Member, error) {
	return nil, nil
}
func (m *mockMemberRepository) SelectByUserID(string) (*[]model.Member, error) {
	return nil, nil
}
func (m *mockMemberRepository) SelectByUserIDAndRoomID(string, int) (*model.Member, error) {
	return nil, nil
}
func (m *mockMemberRepository) SelectByRoomIDAndState(roomID int, state int) (*[]model.Member, error) {
	return nil, nil
}

func TestHandle(t *testing.T) {
	logic := newReqEnterLogic(newMockMemberRepository())
	res, err := logic.handle("test-user", 42)
	if err != nil {
		t.Fatal(err)
	}

	expect := &model.Member{
		UserID: "test-user",
		RoomID: 42,
		State:  enum.PENDING,
	}
	assert.Equal(t, *res, *expect)
}
