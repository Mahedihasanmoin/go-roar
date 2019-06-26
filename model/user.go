package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"

	//"go-roar/helper"
	"net/http"
)

type User struct {
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
func (User) TableName() string {
	return "user"
}

func StoreUser(w http.ResponseWriter,user User )  int{
	db.SingularTable(true)
	insert := db.Debug().Create(&user).RowsAffected
	//helper.RespondwithJSON(w, insert.RowsAffected)

	return int(insert)
}

type FullResponseData struct {
	Data     []User
	TotalRows int
}
func GetAllUser(w http.ResponseWriter,offset int,limit int) FullResponseData{
	log.Println("MODEL :: GetAllUser => start")

	var user []User
	var totalData = 0
	db.Table("user").
		Select("*").
		Where("status = ?", 1).
		Offset(offset).
		Limit(limit).
		Count(&totalData).
		Scan(&user)
	defer db.Close()

	var res FullResponseData
	res.TotalRows = totalData
	res.Data = user
	return res
}


func GetUser(w http.ResponseWriter,id int) []User{
	log.Println("MODEL :: GetUser => start")

	var user []User
	db.Table("user").Select("*").Where("id = ?", id).Scan(&user)
	//defer db.Close()
	return user
}


func DelUser(w http.ResponseWriter,id int) {
	log.Println("MODEL :: DelUser => start")
	db.SingularTable(true)
	db.Debug().Unscoped().Where("id = ?", id).Delete(&User{})

}


func EditUser(w http.ResponseWriter,editData User) int{
	log.Println("MODEL :: DelUser => start")
	var user []User
	db.SingularTable(true)
	edit := db.Debug().Model(&user).Where("id = ?",editData.Id).Update(&editData).RowsAffected
	return int(edit)
}