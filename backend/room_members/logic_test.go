package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
	"github.com/jphacks/D_2017/response"
)

type mockAdminRepository struct{}

func newMockAdminRepository() repository.AdminRepositoryInterface {
	return &mockAdminRepository{}
}
func (m *mockAdminRepository) Insert(*model.Admin) (*model.Admin, error) {
	return nil, nil
}
func (m *mockAdminRepository) SelectByUserIDAndRoomID(userID string, roomID int) (*model.Admin, error) {
	if userID == "user1" {
		return &model.Admin{
			UserID: "user1",
			RoomID: 42,
		}, nil
	}
	return nil, nil
}
func (m *mockAdminRepository) SelectByRoomID(int) (*[]model.Admin, error) {
	return nil, nil
}
func (m *mockAdminRepository) DeleteByUserIDAndRoomID(string, int) error {
	return nil
}
func (m *mockAdminRepository) SelectByUserID(userID string) (*[]model.Admin, error) {
	return nil, nil
}

type mockMemberRepository struct{}

func newMockMemberRepository() repository.MemberRepositoryInterface {
	return &mockMemberRepository{}
}

func (m *mockMemberRepository) Insert(*model.Member) (*model.Member, error) {
	return nil, nil
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
	members := []model.Member{
		{UserID: "user1", RoomID: 42, State: enum.ACCEPT},
		{UserID: "user2", RoomID: 42, State: enum.ACCEPT},
		{UserID: "user3", RoomID: 42, State: enum.ACCEPT},
	}
	return &members, nil
}

func TestHandle(t *testing.T) {
	logic := newRoomMembersLogic(newMockMemberRepository(), newMockAdminRepository())
	res, err := logic.handle("user1", 42)
	if err != nil {
		t.Fatal(err)
	}

	expect := &response.RoomMemberResponse{
		Members: []response.Member{
			{UserID: "user1"},
			{UserID: "user2"},
			{UserID: "user3"},
		},
	}
	assert.Equal(t, *res, *expect)

	res, err = logic.handle("user2", 42)
	if err != nil {
		t.Fatal(err)
	}
	assert.Empty(t, res)
}
