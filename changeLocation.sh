#!/bin/bash

loc=$(getLocation.sh $1)
if [ $? -eq 0 ]; then 
	cd "$(getLocation.sh $1)"
else 
	echo $loc
fi
