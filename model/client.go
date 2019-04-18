package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

type Client struct {
	gorm.Model
	ClientId int    `gorm:"column:client_id"`
	StrName  string `gorm:"column:str_name"`
	BlnOnOff int    `gorm:"column:bln_on_off"`

}

func GetMunicipality() []Client{
	log.Println("MODEL :: GetMunicipality => start")

	var clients []Client
	db.Table("clients").Select("client_id, str_name").Where("bln_on_off = ?", 1).Scan(&clients)
	//defer db.Close()
	return clients
}
