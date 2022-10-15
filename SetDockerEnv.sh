#1/bin/bash

path=""

while true; do
	echo -n "full or mid: "
	read mode

	if [ "$mode" = "full" ] || [ "$mode" = "mid" ]; then
		break
	else
		echo "Error: Wrong parameter -> $mode"
	fi
done

if [ $mode = "full" ]; then
	echo \
	"COMPOSE=docker-compose -f srcs/docker-compose.yml

	.PHONY: up build down live logs ps

	up:
		\$(COMPOSE) up -d

	restart:
		\%(COMPOSE) restart

	build:
		\$(COMPOSE) up --build -d

	exec:
		\$(COMPOSE) exec $name /bin/bash

	live:
		\$(COMPOSE) up

	down:
		\$(COMPOSE) down

	logs:
		\$(COMPOSE) logs

	ps:
		\$(COMPOSE) ps

	edit:
		vim ./srcs/docker-compose.yml

	in:
		\$(COMPOSE) exec $name /bin/bash

	clean:
		docker system prune
	" > Makefile

	mkdir -p srcs
	path=$path"srcs/"
fi



echo -n "Docker name name: "
read name

echo -n "Docker image name: "
read image

echo -n "image package manager name: "
read add

echo -n \
"version: \"3.8\"
services:
  $name:
   container_name: $name
   build: .
   image: $image
   entrypoint: tail -f
" > $path"docker-compose.yml"


echo \
"FROM $image

RUN $add bash
" > $path"Dockerfile"
