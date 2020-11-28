package main

import (
	"fmt"
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

func (logic *touchLogic) handle(unixtime int64, idm string, macAddress string) (string, error) {
	// 時刻生成
	time := time.Unix(unixtime, 0)

	// userIDの特定
	card, err := logic.cardRepository.SelectByIDm(idm)
	if err != nil || card == nil {
		fmt.Println("carderror")
		fmt.Println(idm)
		return `{"result":"reject"}`, err
	}
	userID := card.UserID
	fmt.Println(userID)

	//roomIDの特定
	reader, err := logic.readerRepository.SelectByMACAddress(macAddress)
	if err != nil {
		fmt.Println("roomerror")
		return `{"result":"reject"}`, err
	}
	roomID := reader.RoomID
	fmt.Println(roomID)

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
		fmt.Println("member count exceeded")
		return `{"result":"reject"}`, nil
	}
	fmt.Println(memberCount)

	// 体温チェック
	twoWeekAgo := time.AddDate(0, 0, -14)
	temperatures, _ := logic.bodyTemperatureRepository.SelectByUserIDBetween(userID, twoWeekAgo, time)

	// 入室可能フラグ
	canEnter := true

	// 14+1日分のログが毎日あるか確認する用のmap
	dayCountMap := map[int]int{}

	for _, temp := range *temperatures {
		if !temp.IsTrusted {
			continue
		}
		if !room.AllowMissing {
			dayCountMap[temp.CreatedAt.Day()]++
		}
		fmt.Println(temp.Temperature < room.LimitBodyTemperature)
		canEnter = canEnter && (temp.Temperature < room.LimitBodyTemperature)
	}

	if !room.AllowMissing {
		canEnter = canEnter && len(dayCountMap) >= 15
	}
	fmt.Println(canEnter)

	//入れた場合
	if canEnter {
		return enter(logic, userID, roomID)
	}

	// 拒否
	fmt.Println("body temperature too high")
	return `{"result":"reject"}`, nil

}
