// Package database implements postgres connection and queries.
package database

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/spf13/viper"
	"log"
)

// DBConn returns a postgres connection pool.
func DBConn() (*gorm.DB, error) {
	connectionString := viper.GetString("database_url")

	db, err := gorm.Open("mysql", connectionString)
	//defer db.Close()

	if err != nil {
		log.Println("onnection Failed to Open")
	}
	log.Println("Connection Established")

	return db, nil
}

//import (
//	"log"
//	"os"
//	"database/sql"
//	_ "github.com/go-sql-driver/mysql"
//	"github.com/spf13/viper"
//)
//
//// DBConn returns a postgres connection pool.
//func DBConn() (*sql.DB, error) {
//	connectionString :=  viper.GetString("database_url")
//	db, err := sql.Open("mysql", connectionString)
//
//	// if there is an error opening the connection, handle it
//	if err != nil {
//		log.Print(err.Error())
//	}
//
//	err = db.Ping()
//
//	if err != nil {
//		log.Println(err)
//		os.Exit(1)
//	}
//
//	// if no error. Ping is successful
//	log.Println("Ping to database successful, connection is still alive")
//
//
//	return db, nil
//}
