//Package route configures an http server for administration and application resources.
package controller

import (
	"github.com/go-chi/chi"
	"go-roar/helper"
	"go-roar/model"
	"log"
	"net/http"
)

func VideoPlay(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")
	fileName := chi.URLParam(r, "fileName")

	var result []model.VideoPlayDatas
	result = model.VideoPlayData(fileName)

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func VideoPlayRecommended(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")
	catName := chi.URLParam(r, "cat")

	var result []model.VideoPlayDatas
	result = model.VideoPlayRecommandedSql(catName)

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}
