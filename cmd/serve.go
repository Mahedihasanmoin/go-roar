package cmd

import (

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"go-roar/route"
	"log"

)

// serveCmd represents the serve command
var serveCmd = &cobra.Command{
	Use:   "serve",
	Short: "start http server with configured route",
	Long:  `Starts a http server and serves the configured route`,
	Run: func(cmd *cobra.Command, args []string) {
		//route.Start()
		server, err := route.NewServer()
		if err != nil {
			log.Fatal(err)
			//log.Printf("pi.NewServer() err %v\n", err)
		}

		server.Start()
	},
}

func init() {
	RootCmd.AddCommand(serveCmd)

	// Here you will define your flags and configuration settings.
	viper.SetDefault("port", "localhost:4000")
	viper.SetDefault("log_level", "debug")

	viper.SetDefault("auth_login_url", "http://localhost:3000/login")
	viper.SetDefault("auth_login_token_length", 8)
	viper.SetDefault("auth_login_token_expiry", "11m")
	viper.SetDefault("auth_jwt_secret", "random")
	viper.SetDefault("auth_jwt_expiry", "15m")
	viper.SetDefault("auth_jwt_refresh_expiry", "1h")

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// serveCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// serveCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
