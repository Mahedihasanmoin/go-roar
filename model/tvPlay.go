package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type TvPlayData struct {
	gorm.Model
	Name     string `gorm:"column:name"`
	url      string `gorm:"column:url"`
	PlayUrl  string `gorm:"column:play_url"`
	Logo      string `gorm:"column:logo"`
	Category       int `gorm:"column:cattegory"`

}



func TvPlaySql(url string) []TvPlayData {
	log.Println("MODEL :: VideoPlay => start")

	var tvPlayData []TvPlayData
	db.Table("tv").Select("*").Where("status = ?", 1).Where("url = ?", url).Scan(&tvPlayData)
	return tvPlayData
}

func PopularOnTvSql() []VideoPlayDatas {
	log.Println("MODEL :: VideoPlay => start")

	var videoPlayDatas []VideoPlayDatas
	db.Table("videos").Select("*").
		Where("status = ?", 1).
		Where("privacy = ?", 1).
		Where("is_tv = ?", 1).
		Group("videos.id").
		Having("count(*) <= 1").
		Order("play_count DESC").
		Order(gorm.Expr("rand()")).
		Limit(12).
		Scan(&videoPlayDatas)
	return videoPlayDatas
}
