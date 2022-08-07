#!/bin/bash

echo -n "Set volume to -> "
read
if [[ $REPLY -lt 100 && $REPLY -gt 0 ]]; then
	pactl set-sink-volume @DEFAULT_SINK@ $REPLY%
else
	echo "Error: out of range paramenter $1"
fi
