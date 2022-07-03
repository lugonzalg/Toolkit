#!/bin/bash

i=0
j=$(( $2 - 1))
while [ $i -le $j ]
do
	touch $1_0$i.$3
	i=$(( $i + 1 ))
done
