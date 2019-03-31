package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"log"
	"os"
)

// serveCmd represents the serve command

var createControllerCmd = &cobra.Command{
	Use:   "controller",
	Short: "start http server with configured api",
	Long:  `Starts a http server and serves the configured api`,
	Run: func(cmd *cobra.Command, args []string) {
		getControllerName, _:= cmd.Flags().GetString("getControllerName")

		fileName := fmt.Sprintf("./controller/"+getControllerName+".go")
		isExist := Exists(fileName)
		if isExist{
			log.Printf("file %s exists", getControllerName)
		}else {
			file, err := os.Create(fileName)
			if err != nil {
				log.Printf("os.Create",err)
				return
			}
			fmt.Fprintln(file, fmt.Sprintf("package "+getControllerName))
			fmt.Fprintln(file, `import (
			"net/http"

			)`)
			defer file.Close()
		}






		log.Printf("Create controller cmd init",getControllerName)
	},
}
// Exists reports whether the named file or directory exists.
func Exists(name string) bool {
	if _, err := os.Stat(name); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}
	return true
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
