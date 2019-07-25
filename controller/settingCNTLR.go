//Package route configures an http server for administration and application resources.
package controller

import (

	"go-roar/helper"
	"go-roar/model"
	"log"
	"net/http"
)



func GetAllSetting(w http.ResponseWriter, r *http.Request) {
	log.Println("GetAllUser => start")
	setting := model.GetAllSetting(w)
	//log.Println("result => ", user)

	helper.RespondwithJSON(w, setting)
}



