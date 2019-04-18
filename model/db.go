// Package database implements postgres connection and queries.
package model

import (
	//"database/sql"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	//"github.com/spf13/viper"
)

var db *gorm.DB

// DBConn returns a postgres connection pool.
func DBConn() {

	//connectionString := viper.GetString("database_url")
	var err error
	db, err = gorm.Open("mysql", "root:admin123@/parksmart?charset=utf8&parseTime=True&loc=Local")
	//defer db.Close()

	if err != nil {
		log.Println("onnection Failed to Open ", err)
	}

	log.Println("Connection Established")

	db.AutoMigrate(&Client{}, &Event{})
}

func init(){
	DBConn()
}