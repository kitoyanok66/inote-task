DB_DSN := "postgres://task_user:task_pass@localhost:5434/task?sslmode=disable"
MIGRATE := migrate -path ./migrations -database $(DB_DSN)

migrate-new:
	migrate create -ext sql -dir ./migrations $(NAME)

migrate:
	$(MIGRATE) up

migrate-down:
	$(MIGRATE) down

lint:
	golangci-lint run --color=always

run:
	go run cmd/server/main.go
