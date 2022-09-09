#1/bin/bash

cd $1

touch docker-compose.yml

echo \
"
version: "3.8"
serivce:
	image: test

" > docker-compose.yml

echo \
".PHONY: up down logs ps

up:
	test

down:
	test

logs:
	test

ps:
	test
" > Makefile
