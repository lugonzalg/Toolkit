#1/bin/bash

path=""
prog="requirements"

while true; do
	echo -n "full or mid: "
	read mode

	if [ "$mode" = "full" ] || [ "$mode" = "mid" ]; then
		break
	else
		echo "Error: Wrong parameter -> $mode"
	fi
done

echo -n "Docker container name: "
read name

echo -n "Docker image name: "
read image

echo -n "image package manager name: "
read add


if [ $mode = "full" ]; then
	echo \
	"COMPOSE=docker-compose -f $prog/docker-compose.yml

.PHONY: up build clean down edit live logs ps in restart

up:
	\$(COMPOSE) up -d

restart:
	\$(COMPOSE) restart

build:
	\$(COMPOSE) up --build -d

live:
	\$(COMPOSE) up

down:
	\$(COMPOSE) down

logs:
	\$(COMPOSE) logs

ps:
	\$(COMPOSE) ps

edit:
	vim ./$prog/docker-compose.yml

in:
	\$(COMPOSE) exec $name /bin/bash

clean:
	docker system prune

ip:
	\$(COMPOSE) exec $name hostname -I
	" > Makefile

	mkdir -p $prog
	path=$path"$prog/"
fi



echo -n \
"version: \"3.8\"
services:
  $name:
   build: .
   container_name: $name
   image: $image
   entrypoint: tail -f
" > $path"docker-compose.yml"


echo \
"FROM $image

RUN $add bash
" > $path"Dockerfile"
