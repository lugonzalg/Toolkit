#1/bin/bash

path=""
requirements="requirements"

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
read IMAGE

echo -n "IMAGE package manager name: "
read ADD

echo -n "project name: "
read project


if [ $MODE = "full" ]; then
	echo \
	"COMPOSE=docker-compose -f $requirements/docker-compose.yml

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
	vim ./$requirements/docker-compose.yml

clean:
	docker system prune

	" > Makefile


	mkdir -p $requirements
	mkdir -p $requirements/$project
	path=$path"$requirements/"
fi



echo -n \
"version: \"3.8\"
services:
	$name:
		container_name: $name
		build:
			context: ./$project
			dockerfile: Dockerfile
		entrypoint: tail -f
" > $path"docker-compose.yml"


echo \
"FROM $IMAGE

RUN $ADD bash
" > $path"Dockerfile"
