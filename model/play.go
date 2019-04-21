package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type VideoPlayDatas struct {
	gorm.Model
	Title     string `gorm:"column:title"`
	Uuid      string `gorm:"column:uuid"`
	FileName  string `gorm:"column:file_name"`
	Desc      string `gorm:"column:desc"`
	Cat       string `gorm:"column:cat"`
	PlayCount string `gorm:"column:play_count"`
}



func VideoPlayData(fileName string) []VideoPlayDatas {
	log.Println("MODEL :: VideoPlay => start")

	var videoPlayDatas []VideoPlayDatas
	db.Table("videos").Select("*").Where("status = ?", 1).Where("file_name = ?", fileName).Scan(&videoPlayDatas)
	return videoPlayDatas
}

func VideoPlayRecommandedSql(catName string) []VideoPlayDatas {
	log.Println("MODEL :: VideoPlay => start")

	var videoPlayDatas []VideoPlayDatas
	db.Table("videos").Select("*").Where("status = ?", 1).Where("privacy = ?", 1).Where("cat = ?", catName).Order(gorm.Expr("rand()")).Limit(10).Scan(&videoPlayDatas)
	return videoPlayDatas
}
