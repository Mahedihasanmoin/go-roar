package model

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"

	//"go-roar/helper"
	"net/http"
)


type GlobalSettings struct {
	AppIsOnl 		bool `json:"appIsOnl"`
	DtCreation string `gorm:"column:dtCreation"`
	DtModification string `gorm:"column:dtModification"`
	BlnOnOff int `gorm:"column:blnOnOff"`
	ImagePath string `gorm:"column:ImagePath"`
	TxtOfflineMsg string `gorm:"column:txtOfflineMsg"`
	IntLogVerbosity int `gorm:"column:intLogVerbosity"`
	IntDebugFlag int `gorm:"column:intDebugFlag"`
	StrSmtp string `gorm:"column:strSmtp"`
	StrTerminalIDDevelopment string `gorm:"column:strTerminalIDDevelopment"`
	TxtJumpTitleEn string `gorm:"column:txtJumpTitle_en"`
	TxtJumpTitleFr string `gorm:"column:txtJumpTitle_fr"`
	StrPurgeLog string `gorm:"column:strPurgeLog"`
	TxtCookiesMsg string `gorm:"column:txtCookiesMsg"`
	StrFromEmailName string `gorm:"column:strFromEmailName"`
	StrFromEmail string `gorm:"column:strFromEmail"`
	StrFromSubject string `gorm:"column:strFromSubject"`
	TxtFromBody string `gorm:"column:TxtFromBody"`
	TxtCookiesMsgFr string `gorm:"column:txtCookiesMsg_fr"`
	TxtOfflineMsgFr string `gorm:"column:txtOfflineMsg_fr"`
	TxtJavascriptError  string `gorm:"column:txtJavascriptError"`
	TxtJavascriptErrorFr string `gorm:"column:txtJavascriptError_fr"`

	gorm.Model

}

// set User's table name to be `profiles`
func (GlobalSettings) TableName() string {
	return "global_settings"
}




func GetAllSetting(w http.ResponseWriter) GlobalSettings{
	log.Println("MODEL :: GetAllUser => start")

	var setting = GlobalSettings{}
	setting.AppIsOnl = true

	db.Table("global_settings").
		Select("*").
		Scan(&setting)
	defer db.Close()
	return setting


}
