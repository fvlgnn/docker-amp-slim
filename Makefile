install:
	@mkdir -p ./db
	@mkdir -p ./logs/db
	@mkdir -p ./logs/web
	@docker-compose up -d --build

start:
	@docker-compose start

stop:
	@docker-compose stop

remove:
	@docker-compose down

purge:
	@docker-compose down
	@rm -rf ./db/*
	@rm -rf ./logs/db/*
	@rm -rf ./logs/web/*

validate:
	@docker-compose config

bash-db:
	@docker-compose exec db bash

bash-web:
	@docker-compose exec web bash
	
