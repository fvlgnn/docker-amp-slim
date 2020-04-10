install:
	@mkdir -p ./logs/app
	@mkdir -p ./logs/db
	@mkdir -p ./db
	@docker-compose up -d --build

start:
	@docker-compose start

stop:
	@docker-compose stop

remove:
	@docker-compose down

purge:
	@docker-compose down
	@rm -rf ./logs/app/*
	@rm -rf ./logs/db/*
	@find ./db/* -type f -not -name 'README.txt' -print0 | xargs -0  -I {} rm -f {}
	@find ./db/* -type d -print0 | xargs -0  -I {} rm -rf {}

validate:
	@docker-compose config


	
