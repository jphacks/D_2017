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
	return temp, nil
}

func (m *mockBodyTemperatureRepository) UpdateIsTrustedByID(isTrusted bool, id int) (*model.BodyTemperature, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	return &model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &t,
	}, nil
}

func (m *mockBodyTemperatureRepository) SelectByID(id int) (*model.BodyTemperature, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	return &model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &t,
	}, nil

}

func (m *mockBodyTemperatureRepository) SelectByUserID(userID string, offset int, limit int) (*[]model.BodyTemperature, error) {
	var array [3]model.BodyTemperature
	times := [3]time.Time{
		time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 14, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 15, 24, 0, time.UTC),
	}
	array[0] = model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[0],
	}
	array[1] = model.BodyTemperature{
		ID:          43,
		UserID:      "test-user",
		Temperature: 36.3,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[1],
	}
	array[2] = model.BodyTemperature{
		ID:          44,
		UserID:      "test-user",
		Temperature: 36.6,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[2],
	}
	res := array[:]
	return &res, nil
}

func (m *mockBodyTemperatureRepository) SelectByUserIDBetween(userID string, since time.Time, until time.Time) (*[]model.BodyTemperature, error) {
	var array [3]model.BodyTemperature
	times := [3]time.Time{
		time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 14, 24, 0, time.UTC),
		time.Date(2014, time.December, 31, 12, 15, 24, 0, time.UTC),
	}
	array[0] = model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[0],
	}
	array[1] = model.BodyTemperature{
		ID:          43,
		UserID:      "test-user",
		Temperature: 36.3,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[1],
	}
	array[2] = model.BodyTemperature{
		ID:          44,
		UserID:      "test-user",
		Temperature: 36.6,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   true,
		CreatedAt:   &times[2],
	}
	res := array[:]
	return &res, nil
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

	expect, err := model.NewBodyTemperature("test-user", 37.0, "00:00:00:00:00")
	assert.Equal(t, expect, res)
}
