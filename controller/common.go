//Package route configures an http server for administration and application resources.
package controller

import (
	"github.com/go-chi/chi"
	"go-roar/helper"
	"go-roar/model"
	"log"
	"net/http"
	"strconv"
)

func NewReleaseHomePage(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")

	var result []model.VideoNewRelese
	result = model.VideoNewReleaseHomePageSql()

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func AllVideos(w http.ResponseWriter, r *http.Request) {
	log.Println("VideoPlay => start")

	offset, _ := strconv.ParseUint(chi.URLParam(r, "offset"), 10, 32)
	limit, _ := strconv.ParseUint(chi.URLParam(r, "limit"), 10, 32)

	var result []model.AllVideos
	result = model.AllVideosSql(int(limit), int(offset))

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}

func TopTrending(w http.ResponseWriter, r *http.Request) {


	all := chi.URLParam(r, "all")

	offset, _ := strconv.ParseUint(chi.URLParam(r, "offset"), 10, 32)
	limit, _ := strconv.ParseUint(chi.URLParam(r, "limit"), 10, 32)

	var result []model.AllVideos
	result = model.MostPopularSql(int(limit), int(offset), all)

	log.Println("result => ", result)

	helper.RespondwithJSON(w, result)
}
