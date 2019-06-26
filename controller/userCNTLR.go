//Package route configures an http server for administration and application resources.
package controller

import (
	"encoding/json"
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"
	"strconv"
	"github.com/go-chi/chi"
)

func StoreUser(w http.ResponseWriter, r *http.Request) {
	log.Println("StoreUser => start")
	var saveUserData = model.User{}

	err := json.NewDecoder(r.Body).Decode(&saveUserData)

	if err != nil {
		log.Println("StoreUser decoder error v%", err)
	}
	store := model.StoreUser(w,saveUserData)
	if store ==1  {
		helper.JsonResponse(map[string]string{"message": "Successfull."}, w)
	}
}

func GetAllUser(w http.ResponseWriter, r *http.Request) {
	log.Println("GetAllUser => start")
	offset,_ := strconv.ParseUint(chi.URLParam(r, "offset"), 10, 32)
	limit,_ := strconv.ParseUint(chi.URLParam(r, "lomit"), 10, 32)

	user := model.GetAllUser(w,int(offset),int(limit))
	//log.Println("result => ", user)

	helper.RespondwithJSON(w, user)
}


func GetUser(w http.ResponseWriter, r *http.Request){
	log.Println("CNTRL :: GetUser => start")
	id,_ := strconv.ParseUint(chi.URLParam(r, "id"), 10, 32)

	user := model.GetUser(w,int(id))

	log.Println("result => ", user)

	helper.RespondwithJSON(w, user)
}



func DelUser(w http.ResponseWriter, r *http.Request){
	log.Println("CNTRL :: DelUser => start")
	id,_ := strconv.ParseUint(chi.URLParam(r, "id"), 10, 32)

	 model.DelUser(w,int(id))


	helper.RespondwithJSON(w, "1")
}


func EditUser(w http.ResponseWriter, r *http.Request) {
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