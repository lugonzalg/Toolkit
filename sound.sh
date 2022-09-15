#!/bin/bash

echo -n "Set volume to -> "
read
if [[ $REPLY -lt 100 && $REPLY -gt 0 ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ $REPLY%
elif [[ "$1" = "off" ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ "off"
elif [[ "$1" = "on" ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ "on"
else
	echo "Error: out of range paramenter $1"
fi
