package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"io/ioutil"
	"log"
	"os"
	"strings"
)
var modelName string
// serveCmd represents the serve command

var createModelCmd = &cobra.Command{
	Use:   "make:model",
	Short: "start http server with configured api",
	Long:  `Starts a http server and serves the configured api`,
	Run: func(cmd *cobra.Command, args []string) {
		getModelName, _:= cmd.Flags().GetString("getModelName")
		modelName = getModelName
		log.Printf("Create model cmd init",getModelName)
		genModel(getModelName)
	},
}

func init() {
	RootCmd.AddCommand(createModelCmd)


	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// serveCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// serveCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
	createModelCmd.Flags().StringP("getModelName", "n", "", "Set your model name")

}

func modelStr(modelName string)  string{
	var model = fmt.Sprintf(`package model
		import (
		_ "github.com/go-sql-driver/mysql"
		//"github.com/jinzhu/gorm"
		_ "github.com/jinzhu/gorm/dialects/mysql"
		//"go-roar/helper"
		"net/http"
		)
		type %s struct {
			gorm.Model
		}
		
		func Store%sData(w http.ResponseWriter,item %s ) {
		
		}
		
		func GetAll%sData(w http.ResponseWriter){
		
		}
		
		func GetById%sData(w http.ResponseWriter,id int){
		
		}
		
		func Del%sData(w http.ResponseWriter,id int) {
			
		}
		
		func Update%sData(w http.ResponseWriter) {
		
		}
		`,modelName,modelName,modelName,modelName,modelName,modelName,modelName)
	return model
}


func genModel(getModelName string) {
	formatModelName := strings.Replace(strings.Title(strings.Replace(getModelName, "_", " ", -1)), " ", "", -1)
	path := fmt.Sprintf("model/%s.go",formatModelName)
	_, err := os.Stat(path)
	if err == nil {
		log.Printf("model %s exists", formatModelName)
	} else if os.IsNotExist(err) {
		f, err := os.OpenFile(path, os.O_WRONLY|os.O_CREATE, 0666)
		if err != nil {
			//handle error
			log.Printf("model create %s error", err)
		}

		defer f.Close()

	} else {
		log.Printf("model %s stat error: %v", formatModelName, err)
	}

	modelSTR := modelStr(formatModelName)
	if err := ioutil.WriteFile(path, []byte(modelSTR), 0644); err != nil {
		log.Println(err)
		return
	}
	fmt.Println("OK")

}
