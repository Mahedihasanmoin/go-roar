package helper

import (
	"encoding/json"
	"fmt"
	"net/http"
)

func catch(err error) {
	if err != nil {
		panic(err)
	}
}

// respondwithError return error message
func respondWithError(w http.ResponseWriter, msg string) {
	RespondwithJSON(w, map[string]string{"message": msg})
}

// respondwithJSON write json response format
func RespondwithJSON(w http.ResponseWriter, payload interface{}) {
	response, _ := json.Marshal(payload)
	fmt.Println(payload)
	w.Header().Set("Content-Type", "application/json")
	w.Write(response)
}
