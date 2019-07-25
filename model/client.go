package model

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	//"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
	"reflect"
	//"strconv"

	//"go-roar/helper"
	"net/http"
)



type ClientInfo struct {
	Country 		string
	City 			string
	SortBy 			string
	Offset 			int
	Limit 			int

}
type ClientFullResponseData struct {
	Data     []User
	TotalRows int
}
func GetAllUserClientModule(w http.ResponseWriter, a interface{}) ClientFullResponseData{
	log.Println("MODEL :: GetAllUser => start",a)
	v := reflect.ValueOf(a)
	v.NumField()

	country := fmt.Sprintf("%s", v.FieldByName("Country"))
	city := fmt.Sprintf("%s", v.FieldByName("City"))
	sort := fmt.Sprintf("id %s", v.FieldByName("SortBy"))
	offset :=  fmt.Sprintf("%d", v.FieldByName("Offset"))
	limit :=  fmt.Sprintf("%d", v.FieldByName("Limit"))




	// create a new relation
	var user []User
	query := db.Table("user").Select("*")
	// add more filter
	if country !="" && city !="" {
		query = query.Where("country = ? AND city = ?", country,city)
	}else if country !="" {
		query = query.Where("country = ?",country)

	}else if city !="" {
		query = query.Where("city = ?", v.FieldByName("City"))
	}

	query.Order(sort).
		Limit(limit).
		Offset(offset).
		Find(&user)


	var totalData = 0


// count all data
	count := db.Table("user")
	count.Count(&totalData)


	var res ClientFullResponseData
	res.TotalRows = totalData
	res.Data = user
	return res
}

