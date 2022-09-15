#1/bin/bash

echo $PWD

echo -n "Docker image name: "
read REPLY

echo \
"version: \"3.8\"
services:
  $REPLY:
    build: .
    image: $REPLY
" > docker-compose.yml

echo \
".PHONY: up build down live logs ps

up:
	docker-compose up -d

build:
	docker-compose up --build -d

exec:
	docker-compose exec $REPLY /bin/bash

live:
	docker-compose up

down:
	docker-compose down

logs:
	docker-compose logs

ps:
	docker-compose ps
" > Makefile

echo \
"FROM $REPLY
" > Dockerfile
