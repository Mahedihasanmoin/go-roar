package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"

	//"go-roar/helper"
	"net/http"
)


type GlobalSettings struct {
	Id        uint `gorm:"primary_key"`
	FirstName 		string
	LastName  		string
	Email 			string
	Phone 			string
	Dob 			string
	City 			string
	Country 		string
	Fax 			string
	Password 		string
	Status 			string
	UserLevel 		int
	CreatedBy 		int
	UpdatedBy 		int
	gorm.Model

}

// set User's table name to be `profiles`
func (GlobalSettings) TableName() string {
	return "global_settings"
}




func GetAllSetting(w http.ResponseWriter) {
	log.Println("MODEL :: GetAllUser => start")

	var user []User
	var totalData = 0
	db.Table("user").
		Select("*").
		Where("status = ?", 1).
		Offset(0).
		Limit(10).
		Count(&totalData).
		Scan(&user)
	defer db.Close()


}




func EditSetting(w http.ResponseWriter,editData User) int{
	log.Println("MODEL :: DelUser => start")
	var user []User
	db.SingularTable(true)
	edit := db.Debug().Model(&user).Where("id = ?",editData.Id).Update(&editData).RowsAffected
	return int(edit)
}