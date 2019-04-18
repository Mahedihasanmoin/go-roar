package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type Event struct {
	gorm.Model
	StrName  string `gorm:"column:str_name"`
	BlnOnOff int    `gorm:"column:bln_on_off"`

}

func GetEvents() []Event{
	log.Println("MODEL :: GetMunicipality => start")

	var Events []Event
	db.Table("events").Select("str_name").Where("bln_on_off = ?", 1).Scan(&Events)
	//defer db.Close()
	return Events
}
