//Package route configures an http server for administration and application resources.
package controller

import (
	"github.com/go-chi/chi"
	"go-roar/helper"
	"go-roar/model"
	"log"
	"net/http"

)


func TvPlay(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")
	url := chi.URLParam(r, "url")

	var result []model.TvPlayData
	result = model.TvPlaySql(url)

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func PopularOnTv(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")

	var result []model.VideoPlayDatas
	result = model.PopularOnTvSql()

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}
