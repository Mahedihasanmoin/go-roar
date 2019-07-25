//Package route configures an http server for administration and application resources.
package route

import (
	"go-roar/controller"
	"go-roar/logging"
	"net/http"
	"time"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/cors"
	"github.com/go-chi/render"
)

// New configures application resources and routes.
func New(enableCORS bool) (*chi.Mux, error) {
	logger := logging.NewLogger()

	r := chi.NewRouter()
	r.Use(middleware.Recoverer)

	r.Use(middleware.RequestID)
	// r.Use(middleware.RealIP)
	r.Use(middleware.DefaultCompress)
	r.Use(middleware.Timeout(15 * time.Second))

	r.Use(logging.NewStructuredLogger(logger))
	r.Use(render.SetContentType(render.ContentTypeJSON))

	// use CORS middleware if client is not served by this route, e.g. from other domain or CDN
	if enableCORS {
		r.Use(corsConfig().Handler)
	}

	r.Get("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("pong"))
	})


	r.Post("/user/create", controller.StoreUser)
	r.Get("/user/getall/{offset}/{limit}", controller.GetAllUser)
	r.Get("/user/userinfo/{id}", controller.GetUser)
	r.Get("/user/alluserinfo", controller.GetAllUser)
	r.Get("/user/alluserinfo/fliter_by", controller.GetAllUserClient)

	r.Post("/user/delete/{id}", controller.DelUser)
	r.Put("/user/update", controller.EditUser)

	r.Get("/globalsettings", controller.GetAllSetting)

	return r, nil
}

func corsConfig() *cors.Cors {
	// Basic CORS
	// for more ideas, see: https://developer.github.com/v3/#cross-origin-resource-sharing
	return cors.New(cors.Options{
		// AllowedOrigins: []string{"https://foo.com"}, // Use this to allow specific origin hosts
		AllowedOrigins: []string{"*"},
		// AllowOriginFunc:  func(r *http.Request, origin string) bool { return true },
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           86400, // Maximum value not ignored by any of major browsers
	})
}
