//Package route configures an http server for administration and application resources.
package controller

import (
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"

)


func GetTvList(w http.ResponseWriter, r *http.Request) {
	log.Println("GetMunicipality => start")
	//var result []model.Client

	//db.Table("clients").Select("ClientId, strName").Where("blnOnOff = ?", 1).Scan(&result)
	//helper.RespondwithJSON(w, result)

	var result []model.Tv
	result = model.GetTvListSql()

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

