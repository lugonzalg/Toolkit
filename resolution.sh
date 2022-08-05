#!/bin/bash

if [[ "$1" = "display" ]]; then
	displays=$(xrandr)
	for elem in $displays; do
		echo $elem
	done
else
	echo "Error: Wrong parameter $1"
	echo "	display"
fi
