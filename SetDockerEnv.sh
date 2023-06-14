#1/bin/bash

PATH=""
REQUIREMENTS="requirements"

while true; do
	echo -n "full or mid: "
	read MODE

	if [ "$MODE" = "full" ] || [ "$MODE" = "mid" ]; then
		break
	else
		echo "Error: Wrong parameter -> $MODE"
	fi
done

echo -n "Docker container NAME: "
read NAME

echo -n "Docker IMAGE NAME: "
read IMAGE

echo -n "IMAGE package manager NAME: "
read ADD

echo -n "PROJECT name: "
read PROJECT


if [ $MODE = "full" ]; then
	echo \
	"COMPOSE=docker-compose -f $REQUIREMENTS/docker-compose.yml

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
	vim ./$REQUIREMENTS/docker-compose.yml

clean:
	docker system prune

	" > Makefile

	mkdir -p $REQUIREMENTS
	mkdir -p $PROJECT
	PATH=$PATH"$REQUIREMENTS/"
fi



echo -n \
"version: \"3.8\"
services:
	$NAME:
		container_NAME: $NAME
		build:
			context: ./$PROJECT
			dockerfile: Dockerfile
		entrypoint: tail -f
" > $PATH"docker-compose.yml"


echo \
"FROM $IMAGE

RUN $ADD bash
" > $PATH"Dockerfile"
