package main

import (
	"testing"
	"time"

	"github.com/jphacks/D_2017/repository"
	"github.com/stretchr/testify/assert"

	"github.com/jphacks/D_2017/model"
)

type mockBodyTemperatureRepository struct {
}

func (m *mockBodyTemperatureRepository) Insert(temp *model.BodyTemperature) (*model.BodyTemperature, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	return &model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 37.0,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &t,
	}, nil
}

func (m *mockBodyTemperatureRepository) UpdateIsTrustedByID(isTrusted bool, id int) (*model.BodyTemperature, error) {
	return nil, nil
}

func (m *mockBodyTemperatureRepository) SelectByID(id int) (*model.BodyTemperature, error) {
	return nil, nil
}

func (m *mockBodyTemperatureRepository) SelectByUserID(userID string, offset int, limit int) (*[]model.BodyTemperature, error) {
	return nil, nil
}

func (m *mockBodyTemperatureRepository) SelectByUserIDBetween(userID string, since time.Time, until time.Time) (*[]model.BodyTemperature, error) {
	return nil, nil
}

func newMockBodyTemperatureRepository() repository.BodyTemperatureRepositoryInterface {
	return &mockBodyTemperatureRepository{}
}

func TestHandle(t *testing.T) {
	logic := newInsertTempLogLogic(newMockBodyTemperatureRepository())
	res, err := logic.handle("test-user", 37.0, "00:00:00:00:00")
	if err != nil {
		t.Fatal(err)
	}

	date := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	expect := &model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 37.0,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &date,
	}
	assert.Equal(t, expect, res)
}
