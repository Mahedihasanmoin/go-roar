//Package route configures an http server for administration and application resources.
package controller

import (
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"

)

func GetMunicipality(w http.ResponseWriter, r *http.Request) {
	log.Println("GetMunicipality => start")
	//var result []model.Client

	//db.Table("clients").Select("ClientId, strName").Where("blnOnOff = ?", 1).Scan(&result)
	//helper.RespondwithJSON(w, result)

	var result []model.Client
	result = model.GetMunicipality()

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func GetEvents(w http.ResponseWriter, r *http.Request) {
	log.Println("GetMunicipality => start")


	var events []model.Event
	events = model.GetEvents()

	log.Println("result => ", events)

	helper.RespondwithJSON(w, events)
}