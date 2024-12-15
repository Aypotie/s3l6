up:
	@docker compose up -d
down:
	@docker compose down
db-connect:
	@psql -U example_user -h localhost -d zoo