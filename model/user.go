package model

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
	"reflect"

	//"go-roar/helper"
	"net/http"
)

type User struct {
	Id       	    int `gorm:"primary_key";"AUTO_INCREMENT"`
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


type UserAllInfo struct {
	SortBy 			string
	Offset 			int
	Limit 			int
	Status 		 	int

}
type FullResponseData struct {
	Data     []User
	TotalRows int
}
func GetAllUser(w http.ResponseWriter, a interface{}) FullResponseData{
	log.Println("MODEL :: GetAllUser => start")
	v := reflect.ValueOf(a)
	v.NumField()

	sort := fmt.Sprintf("id %s", v.FieldByName("SortBy"))
	offset :=  fmt.Sprintf("%d", v.FieldByName("Offset"))
	limit :=  fmt.Sprintf("%d", v.FieldByName("Limit"))
	status :=  fmt.Sprintf("%d", v.FieldByName("Status"))

	var user []User
	var totalData = 0
	db.Table("user").
		Select("*").
		Where("status = ?", int(status)).
		Order(sort).
		Offset(offset).
		Limit(limit).
		Count(&totalData).
		Scan(&user)
	defer db.Close()

	var res FullResponseData
	res.TotalRows = totalData
	res.Data = user
	return res
	//helper.RespondwithJSON(w, res)
}


func GetUser(w http.ResponseWriter,id int) []User{
	log.Println("MODEL :: GetUser => start")

	var user []User
	db.Table("user").Select("*").Where("id = ?", id).Scan(&user)
	//defer db.Close()
	return user
}


func DelUser(w http.ResponseWriter,id int) int{
	log.Println("MODEL :: DelUser => start")
	db.SingularTable(true)
	del := db.Debug().Unscoped().Where("id = ?", id).Delete(&User{}).RowsAffected
	return int(del)
}


func EditUser(w http.ResponseWriter,editData User) int{
	log.Println("MODEL :: DelUser => start")
	var user []User
	db.SingularTable(true)
	edit := db.Debug().Model(&user).Where("id = ?",editData.Id).Update(&editData).RowsAffected
	return int(edit)
}