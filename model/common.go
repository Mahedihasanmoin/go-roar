package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type VideoNewRelese struct {
	gorm.Model
	Title     string `gorm:"column:title"`
	Uuid      string `gorm:"column:uuid"`
	FileName  string `gorm:"column:file_name"`
	Desc      string `gorm:"column:desc"`
	Cat       string `gorm:"column:cat"`
	PlayCount string `gorm:"column:play_count"`
}

func VideoNewReleaseHomePageSql() []VideoNewRelese {
	log.Println("MODEL :: VideoPlay => start")

	var videoNewRelese []VideoNewRelese
	db.Table("videos").Select("*").Where("status = ?", 1).Where("privacy = ?", 1).Order("id desc").Limit(2).Scan(&videoNewRelese)
	return videoNewRelese
}

type AllVideos struct {
	gorm.Model
	Title     string `gorm:"column:title"`
	Uuid      string `gorm:"column:uuid"`
	FileName  string `gorm:"column:file_name"`
	Desc      string `gorm:"column:desc"`
	Cat       string `gorm:"column:cat"`
	PlayCount string `gorm:"column:play_count"`
}

func AllVideosSql(limit, offset int) []AllVideos {
	log.Println("MODEL :: VideoPlay => start")

	var allVideos []AllVideos
	db.Table("videos").Select("*").Where("status = ?", 1).Where("privacy = ?", 1).Order(gorm.Expr("rand()")).Limit(limit).Offset(offset).Scan(&allVideos)
	return allVideos
}

func TopTrendingSql(limit, offset int, all string) []AllVideos {
	log.Println("MODEL :: VideoPlay => start")

	var allVideos []AllVideos
	if limit > 0 && all != "" {
		db.Table("videos").Select("*").Where("status = ?", 1).Where("privacy = ?", 1).Order(gorm.Expr("rand()")).Limit(limit).Offset(offset).Scan(&allVideos)
	} else {
		db.Table("videos").Select("*").Where("status = ?", 1).Where("privacy = ?", 1).Order(gorm.Expr("rand()")).Limit(limit).Scan(&allVideos)
	}

	return allVideos
}
