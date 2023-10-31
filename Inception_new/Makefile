include srcs/.env
export

DC = docker compose 
CDIR = srcs
CFILE = ${CDIR}/docker-compose.yml
ARGS = -f ${CFILE}

all:
	docker compose -f ./srcs/docker-compose.yml up -d --build

mkdir:
	mkdir /home/vgejno/data /home/vgejno/data/wordpress /home/vgejno/data/mariadb

start:
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	cd ./srcs && docker compose stop

clean: stop
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	rm -rf home/vgejno/data/wordpress/*
	rm -rf home/vgejno/data/mariadb/*
	rm -rf tmp/data/wordpress/*
	rm -rf tmp/data/mariadb/*
	yes | docker system prune -a --force
	yes | docker volume prune

re: down clean all

.PHONY: up down build

# include srcs/.env
# export

# COMPOSE_DIR = srcs
# COMPOSE_FILE = $(COMPOSE_DIR)/docker-compose.yml

# BIN = docker compose
# ARGS = -f $(COMPOSE_FILE)
# DKC = $(BIN) $(ARGS)
# DKC_CONFIG = $(DKC) config

# COMPOSE_PROJECT_NAME ?= $(COMPOSE_DIR)
# HOST_VOLUME_ROOT ?= /home/$(USER)/data

# VOLUME_MOUNTS = wordpress mariadb
# VOLUME_PATHS = $(addprefix $(HOST_VOLUME_ROOT)/, $(VOLUME_MOUNTS))
# VOLUME_NAMES = $(addprefix	$(COMPOSE_PROJECT_NAME)_, \
# 							$(shell $(DKC_CONFIG) --volumes))  

# IMAGES = $(shell $(DKC_CONFIG) --images)

# all: install

# up:
# 	$(DKC) up -d

# down:
# 	$(DKC) down

# logs:
# 	$(DKC) logs -f

# volumes:
# 	mkdir -p $(VOLUME_PATHS)

# info:
# 	@echo -e "IMAGES:"
# 	@$(DKC_CONFIG) --images
# 	@echo -e "\nVOLUMES:"
# 	@$(DKC_CONFIG) --volumes
# 	@echo -e "\nCONTAINERS:"
# 	@$(DKC) ps -a

# build:
# 	$(DKC) build --no-cache

# install: volumes build
# 	chmod +x ./srcs/tools/config.sh
# 	sudo ./srcs/tools/config.sh ${DOMAIN_NAME}
# 	$(DKC) create
# 	@$(MAKE) -s info
# 	@$(MAKE) up
# 	# chmod -R 777 /home/${USER}/data

# clean-volumes:
# 	-docker volume rm $(VOLUME_NAMES)

# fclean-volumes: clean-volumes
# 	sudo rm -rf $(VOLUME_PATHS)

# clean-images:
# 	-docker rmi -f $(IMAGES)

# fclean-images:
# 	-docker rmi -f $(IMAGES)

# clean-containers:
# 	$(DKC) kill --remove-orphans
# 	$(DKC) rm -f

# clear:
# 	echo 'docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null'

# clean: down clean-containers clean-volumes clean-images info
# fclean: down clean-containers fclean-volumes fclean-images info
# 	rm -rf /home/${USER}/data
# re: down clean all
# reset-all: fclean install all