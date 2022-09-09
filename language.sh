#!/bin/bash

echo -n choose a language between es and us: " "
read
if [[ $REPLY == "es" || $REPLY == "us" ]]; then
	setxkbmap $REPLY
else
	echo "Error: Wrong paramenter to language: $1"
fi
