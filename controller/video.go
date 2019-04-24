//Package route configures an http server for administration and application resources.
package controller

import (
	"net/http"
	"go-roar/model"
	"go-roar/helper"
	"log"
	"strconv"
	"github.com/go-chi/chi"
)


func VideoCat(w http.ResponseWriter, r *http.Request) {

	offset, _ := strconv.ParseUint(chi.URLParam(r, "offset"), 10, 32)
	limit, _ := strconv.ParseUint(chi.URLParam(r, "limit"), 10, 32)

	var result model.FinalDataCatType
	result = model.VideoCatSql(int(limit),int(offset))

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func CatWiseVideo(w http.ResponseWriter, r *http.Request) {

	cat, _ := strconv.ParseUint(chi.URLParam(r, "cat"), 10, 32)


	var result []model.AllVideos
	result = model.CatWiseVideoSql(int(cat))

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}
