package main

import (
	"fmt"
	"testing"
	"time"

	"github.com/jphacks/D_2017/repository"

	"github.com/jphacks/D_2017/model"
)

type mockBodyTemperatureRepository struct {
}

func (m *mockBodyTemperatureRepository) Insert(*model.BodyTemperature) (*model.BodyTemperature, error) {
	t := time.Date(2014, time.December, 31, 12, 13, 24, 0, time.UTC)
	return &model.BodyTemperature{
		ID:          42,
		UserID:      "test-user",
		Temperature: 36.5,
		MACAddress:  "00:00:00:00:00",
		IsTrusted:   false,
		CreatedAt:   &t,
	}, nil
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
	logic := newGetTempLogLogic(newMockBodyTemperatureRepository())
	res, err := logic.handle("test_user", 0, 3)
	if err != nil {
		t.Fatal(err)
	}

	var s [3]string
	s[0] = "{\"ID\":42,\"UserID\":\"test-user\",\"Temperature\":36.5,\"MACAddress\":\"00:00:00:00:00\",\"IsTrusted\":true,\"CreatedAt\":\"2014-12-31T12:13:24Z\"}"
	s[1] = "{\"ID\":43,\"UserID\":\"test-user\",\"Temperature\":36.3,\"MACAddress\":\"00:00:00:00:00\",\"IsTrusted\":true,\"CreatedAt\":\"2014-12-31T12:14:24Z\"}"
	s[2] = "{\"ID\":44,\"UserID\":\"test-user\",\"Temperature\":36.6,\"MACAddress\":\"00:00:00:00:00\",\"IsTrusted\":true,\"CreatedAt\":\"2014-12-31T12:15:24Z\"}"
	expect := fmt.Sprintf("[%s,%s,%s]", s[0], s[1], s[2])

	if res != expect {
		t.Fatalf("Logs was not matched. expect:%s, actual:%s", expect, res)
	}
}
