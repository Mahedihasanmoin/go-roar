package cmd

import (
	"github.com/spf13/cobra"
	"log"
)

// serveCmd represents the serve command

var createModelCmd = &cobra.Command{
	Use:   "model",
	Short: "start http server with configured api",
	Long:  `Starts a http server and serves the configured api`,
	Run: func(cmd *cobra.Command, args []string) {
		getModelName, _:= cmd.Flags().GetString("getModelName")
		log.Printf("Create model cmd init",getModelName)
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
