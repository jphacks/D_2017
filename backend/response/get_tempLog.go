package response

import (
	"time"
)

// BodyTemperature - 個別の体温ログ
type BodyTemperature struct {
	Temperature  float32   `json:"temperature"`
	IsTrusted    bool      `json:"isTrusted"`
	MeasuredTime time.Time `json:"measuredTime"`
}

// TempLogResponse - 体温ログのレスポンス
type TempLogResponse struct {
	Logs []*BodyTemperature `json:"Logs"`
}
