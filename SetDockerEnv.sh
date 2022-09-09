#1/bin/bash

echo $PWD

echo -n "Docker image name: "
read REPLY

echo \
"version: \"3.8\"
serivce:
	image: $REPLY
" > docker-compose.yml

echo \
'.PHONY: up down live logs ps

up:
	docker-compose up -d

live:
	docker-compose up

down:
	docker-compose down

logs:
	docker-compose logs

ps:
	docker-compose ps
' > Makefile

echo \
"FROM $REPLY

RUN" > Dockerfile
