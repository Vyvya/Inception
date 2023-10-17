#define the target to start Docker Compose environment
up:
	docker-compose up -d

#define the target to stop and remove Docker Compose environment
down:
	docker-compose dowm

#define the target to rebuild Docker Compose environment

build:
	docker-compose up -d --build

.PHONY: up down build	
