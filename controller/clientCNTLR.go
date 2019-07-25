//Package route configures an http server for administration and application resources.
package controller

import (
	"encoding/json"
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"
	//"github.com/go-chi/chi"
)





func GetAllUserClient(w http.ResponseWriter, r *http.Request) {
	log.Println("GetAllUser => start")

	var filter = model.ClientInfo{}
	err := json.NewDecoder(r.Body).Decode(&filter)

	if err != nil {
		log.Println("StoreUser decoder error v%", err)
	}


	user := model.GetAllUserClientModule(w,filter)
	log.Println("result => ", user)

	helper.RespondwithJSON(w, user)
}
