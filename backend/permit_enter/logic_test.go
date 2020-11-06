package main

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/enum"
	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"
)

type mockAdminRepository struct{}

func newMockAdminRepository() repository.AdminRepositoryInterface {
	return &mockAdminRepository{}
}
func (m *mockAdminRepository) Insert(*model.Admin) (*model.Admin, error) {
	return nil, nil
}
func (m *mockAdminRepository) SelectByUserIDAndRoomID(userID string, roomID int) (*model.Admin, error) {
	if userID == "adminUser" {
		return &model.Admin{
			UserID: "adminUser",
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
	return &model.Member{
		UserID: "user1",
		RoomID: 42,
		State:  enum.ACCEPT,
	}, nil
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
	logic := newPermitEnterLogic(newMockMemberRepository(), newMockAdminRepository())
	res, err := logic.handle("adminUser", 42, "user1", true)
	if err != nil {
		t.Fatal(err)
	}

	expect := &model.Member{
		UserID: "user1",
		RoomID: 42,
		State:  enum.ACCEPT,
	}
	assert.Equal(t, *res, *expect)

	res, err = logic.handle("user2", 42, "user1", true)
	if err != nil {
		t.Fatal(err)
	}
	assert.Empty(t, res)

}
