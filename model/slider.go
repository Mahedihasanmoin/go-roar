package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type Slider struct {
	gorm.Model
	Title string    `gorm:"column:title"`
	SliderForPage  string `gorm:"column:slider_for_page"`
	Description string    `gorm:"column:description"`
	BannerUrl string    `gorm:"column:banner_url"`
	TargetUrl string    `gorm:"column:target_url"`
	Sequence string    `gorm:"column:sequence"`
	Status int    `gorm:"column:status"`

}



func GetSlider() []Slider{
	log.Println("MODEL :: GetSlider => start")

	var Slider []Slider
	db.Table("slider").Select("*").Where("status = ?", 1).Scan(&Slider)
	//defer db.Close()
	return Slider
}
