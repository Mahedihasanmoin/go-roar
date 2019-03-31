package cmd

import (
	"github.com/spf13/cobra"
	"log"
)

// serveCmd represents the serve command

var createControllerCmd = &cobra.Command{
	Use:   "controller",
	Short: "start http server with configured api",
	Long:  `Starts a http server and serves the configured api`,
	Run: func(cmd *cobra.Command, args []string) {
		getControllerName, _:= cmd.Flags().GetString("getControllerName")
		log.Printf("Create controller cmd init",getControllerName)
	},
}

func init() {
	RootCmd.AddCommand(createControllerCmd)


	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// serveCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// serveCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
	createControllerCmd.Flags().StringP("getControllerName", "n", "", "Set your controller name")

}
