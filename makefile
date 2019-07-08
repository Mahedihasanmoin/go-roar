PID      = /var/www/go/Jagobd-Web-Backend.pid

hello:
	echo "Hello $(PID)"

build:
	go build -o go-roar main.go
	echo "Build successfully"
	./go-roar serve

run:
	go run main.go