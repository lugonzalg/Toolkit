#!/bin/bash

i=0
j=$(( $2 - 1))
while [ $i -le $j ]
do
	mkdir -p $1$i
	i=$(( $i + 1 ))
done
