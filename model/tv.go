 package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type Tv struct {
	gorm.Model
	Name string    `gorm:"column:name"`
	Url  string `gorm:"column:url"`
	PlayUrl string    `gorm:"column:play_url"`
	Logo string    `gorm:"column:logo"`
	Descriptipn string    `gorm:"column:descriptipn"`
	Category string    `gorm:"column:category"`
	Type string    `gorm:"column:string"`
	Status int    `gorm:"column:status"`

}

func GetTvList() []Tv{
	log.Println("MODEL :: GetTvList => start")

	var tv []Tv
	db.Table("tv").Select("*").Where("status = ?", 1).Scan(&tv)
	return tv
}
