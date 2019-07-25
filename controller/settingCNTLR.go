//Package route configures an http server for administration and application resources.
package controller

import (
	"encoding/json"
	"go-roar/helper"
	"go-roar/model"
	"log"
	"net/http"
)



//func GetAllSetting(w http.ResponseWriter, r *http.Request) {
//	log.Println("GetAllUser => start")
//	user := model.GetAllSetting(w)
//	//log.Println("result => ", user)
//
//	helper.RespondwithJSON(w, user)
//}






func EditSetting(w http.ResponseWriter, r *http.Request) {
	log.Println("EditUser => start")
	var editUserData = model.User{}

	err := json.NewDecoder(r.Body).Decode(&editUserData)

	if err != nil {
		log.Println("EditUser decoder error v%", err)
	}

	edit := model.EditUser(w,editUserData)
	if edit ==1  {
		helper.JsonResponse(map[string]string{"message": "Successfull."}, w)
	}
}