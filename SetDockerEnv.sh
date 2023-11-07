#1/bin/bash

path="."
requirements="requirements"
srcs="srcs"

while true; do
	echo -n "full or mid: "
	read MODE

	if [ "$MODE" = "full" ] || [ "$MODE" = "mid" ]; then
		break
	else
		echo "Error: Wrong parameter -> $MODE"
	fi
done

echo -n "Docker container name: "
read name

echo -n "Docker IMAGE name: "
read image

echo -n "IMAGE package manager name: "
read add

echo -n "project name: "
read project


if [ $MODE = "full" ]; then
	echo \
	"COMPOSE=docker-compose -f $srcs/docker-compose.yml

.PHONY: up build clean down edit live logs ps in restart

up:
	\$(COMPOSE) up -d

restart:
	\$(COMPOSE) restart

build:
	\$(COMPOSE) build --no-cache

live:
	\$(COMPOSE) up

down:
	\$(COMPOSE) down

logs:
	\$(COMPOSE) logs

ps:
	\$(COMPOSE) ps

edit:
	vim ./$srcs/docker-compose.yml

clean:
	docker system prune

	" > Makefile


	mkdir -p $srcs
	mkdir -p $srcs/$requirements
	mkdir -p $srcs/$requirements/$project
	path="$path/$srcs"
fi



#TODO CREATE INTERACTIVE SEQUENCE WHERE I GOT ASKED IF THERE ARE VOLUMES
#TODO CREATE INTERATIVE SEQUENCE TO CREATE MULTIPLE SERVICE WITHIN THE SAME DOCKER COMPOSE

echo -n \
"version: \"3.8\"
services:
  $name:
    container_name: $name
    build:
	  context: ./$requirements/$project
	  dockerfile: Dockerfile

	networks:
	  - default

	entrypoint: tail -f

networks:
  default:
    driver: bridge
" > "$path/docker-compose.yml"


echo \
"FROM $image

RUN $add bash
" > "$path/$requirements/$project/Dockerfile"
