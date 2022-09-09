#!/bin/bash

echo -n Choose an option, set or display: " "
read

if [[ "$REPLY" = "display" ]]; then
	displays=$(xrandr)
	for elem in $displays; do
		echo $elem
	done
elif [[ "$REPLY" = "set" ]]; then
	xrandr --output HDMI-A-0 --mode 2560x1440
else
	echo "Error: Wrong parameter $1"
	echo "	display"
	echo "	set ( default resolution 2560x1440 )"
fi
