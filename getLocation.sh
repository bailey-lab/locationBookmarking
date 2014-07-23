#!/bin/bash

#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo "Takes only one argument, name for bookmark for current location"
	echo "eg. getLocation.sh bookmark"
	exit
fi

check=$(egrep "^$1\>" $LOCBOOKHOME/.ohThePlacesIveBeen.txt | cut -d$'\t' -f2)
if [ -n "$check" ]; then
    echo $check
else
	echo "No bookmarked named $1"
fi
