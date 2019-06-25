package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"

	//"go-roar/helper"
	"net/http"
	"time"
)

type User2 struct {
	id				int			`gorm:"column:id"`
	first_name 		string    	`gorm:"column:first_name"`
	last_name  		string    	`gorm:"column:last_name"`
	email 			string    	`gorm:"column:email"`
	phone 			string    	`gorm:"column:phone"`
	dob 			string    	`gorm:"column:dob"`
	city 			string    	`gorm:"column:city"`
	country 		string    	`gorm:"column:country"`
	fax 			string    	`gorm:"column:fax"`
	password 		string    	`gorm:"column:password"`
	status 			string    	`gorm:"column:status"`
	user_level 		int    		`gorm:"column:user_level"`
	date_created 	time.Time   `gorm:"column:date_created"`
	created_by 		int    		`gorm:"column:created_by"`
	last_updated 	time.Time   `gorm:"column:last_updated"`
	updated_by 		int   		`gorm:"column:updated_by"`


}

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


func GetAllUser() []User{
	log.Println("MODEL :: GetAllUser => start")

	var user []User
	db.Table("user").
		Select("*").
		Where("status = ?", 1).
		Limit(10).
		Scan(&user)
	//defer db.Close()
	return user
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