all:
	docker compose -f ./srcs/docker-compose.yml up -d --build

up:
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	rm -rf home/vgejno/data/wordpress/*
	rm -rf home/vgejno/data/mariadb/*

re: down clean all

.PHONY: up down build	