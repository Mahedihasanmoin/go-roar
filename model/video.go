 package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type VideoCat struct {
	gorm.Model
	Id int    `gorm:"column:id"`
	Title  string `gorm:"column:title"`
	Type string    `gorm:"column:type"`
	Status int    `gorm:"column:status"`
}

 type FinalDataCatType struct {

	 Data []VideoCat
	 Total int
 }


func VideoCatSql(limit,offset int) FinalDataCatType{
	log.Println("MODEL :: GetTvList => start")

	var videoCat []VideoCat
	var count int

	db.Table("category").Select("*").Where("status = ?", 1).Where("type = ?", "video").Count(&count).Limit(limit).Offset(offset).Scan(&videoCat)
	log.Println("video :: count => ",count)

	var res FinalDataCatType
	res.Total =count
	res.Data = videoCat

	return res
}


 func CatWiseVideoSql(cat int) []AllVideos{
	 log.Println("MODEL :: GetTvList => start")

	 var allVideos []AllVideos

	 db.Table("videos").Select("*").
		 Where("cat = ?", cat).
		 Where("status = ?", 1).
		 Where("privacy = ?", 1).
		 Where("is_tv = ?", 0).
		 Group("id").
		 Having("count(*) <= 1").
		 Limit(10).
		 Scan(&allVideos)


	 return allVideos
 }

