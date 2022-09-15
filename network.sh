#!/bin/bash

if [[ "$1" = "reset" ]]; then
	sudo /etc/init.d/network-manager restart
else
	echo "Error: Wrong parameter $1"
	echo "	reset"
fi
