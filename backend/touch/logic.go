package main

import (
	"strconv"
	"time"

	"github.com/jphacks/D_2017/model"
	"github.com/jphacks/D_2017/repository"

	_ "github.com/go-sql-driver/mysql" // グローバル設定を宣言(DBドライバの設定)
)

type touchLogic struct {
	logRepository             repository.LogRepositoryInterface
	readerRepository          repository.ReaderRepositoryInterface
	cardRepository            repository.CardRepositoryInterface
	roomRepository            repository.RoomRepositoryInterface
	bodyTemperatureRepository repository.BodyTemperatureRepositoryInterface
}

func newTouchLogic(logRepository repository.LogRepositoryInterface,
	readerRepository repository.ReaderRepositoryInterface,
	cardRepository repository.CardRepositoryInterface,
	roomRepository repository.RoomRepositoryInterface,
	bodyTemperatureRepository repository.BodyTemperatureRepositoryInterface) *touchLogic {
	return &touchLogic{
		logRepository,
		readerRepository,
		cardRepository,
		roomRepository,
		bodyTemperatureRepository,
	}
}

func exit(logic *touchLogic, log model.Log, time time.Time) (string, error) {
	s := `{"result":"exit"}`
	_, err := logic.logRepository.UpdateLeftAtByID(log.ID, time)
	return s, err
}

func enter(logic *touchLogic, userID string, roomID int) (string, error) {
	s := `{"result":"accept"}`
	log, _ := model.NewLog(userID, roomID)
	_, err := logic.logRepository.Insert(log)
	return s, err
}

func (logic *touchLogic) handle(unixtime string, idm string, macAddress string) (string, error) {
	// 時刻生成
	timeInt, _ := strconv.ParseInt(unixtime, 10, 64)
	time := time.Unix(timeInt, 0)

	// userIDの特定
	card, err := logic.cardRepository.SelectByIDm(idm)
	if err != nil || card == nil {
		return `{"result":"reject"}`, err
	}
	userID := card.UserID

	//roomIDの特定
	reader, err := logic.readerRepository.SelectByMACAddress(macAddress)
	if err != nil {
		return `{"result":"reject"}`, err
	}
	roomID := reader.RoomID

	// 今部屋に入っていれば退室処理
	enteringLogs, err := logic.logRepository.SelectEnteringByRoomID(roomID)
	for _, log := range *enteringLogs {
		if log.UserID == userID {
			return exit(logic, log, time)
		}
	}

	// 入室可能かどうかの判定

	// 現在の人数の確認
	memberCount := len(*enteringLogs)
	room, err := logic.roomRepository.SelectByID(roomID)
	if memberCount >= room.LimitNumber {
		return `{"result":"reject"}`, nil
	}

	// [TODO] allow_missingならログが2週間分あることを確認

	// 体温チェック
	twoWeekAgo := time.AddDate(0, 0, -14)
	temperatures, _ := logic.bodyTemperatureRepository.SelectByUserIDBetween(userID, twoWeekAgo, time)

	canEnter := true
	for _, temp := range *temperatures {
		if !temp.IsTrusted {
			continue
		}
		canEnter = canEnter && (temp.Temperature < room.LimitBodyTemperature)
	}

	//入れた場合
	if canEnter {
		return enter(logic, userID, roomID)
	}

	// 拒否
	return `{"result":"reject"}`, nil

}
