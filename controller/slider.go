//Package route configures an http server for administration and application resources.
package controller

import (
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"

)



func GetSliders(w http.ResponseWriter, r *http.Request) {
	log.Println("GetMunicipality => start")


	var slider []model.Slider
	slider = model.GetSlider()

	log.Println("result => ", slider)

	helper.RespondwithJSON(w, slider)
}