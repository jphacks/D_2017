package response

import (
	"time"
)

type BodyTemperature struct {
	Temperature  float32    `json:"Temperature"`
	IsTrusted    bool       `json:"IsTrusted"`
	MeasuredTime *time.Time `json:"MeasuredTime"`
}

// TempLogResponse - 体温ログのレスポンス
type TempLogResponse struct {
	Logs []*BodyTemperature `json:"Logs"`
}
