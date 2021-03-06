#!/bin/bash


#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo -e "\033[1;38;5;196mTakes only one argument, name for bookmark for current location"
	echo -e "eg. getLocation.sh bookmark\033[0m"
	exit 1
fi

check=$(egrep "^$1\>" $LOCBOOKHOME/.ohThePlacesIveBeen.txt | cut -d$'\t' -f2)
if [ -n "$check" ]; then
    echo $check
else
	echo -e "\033[1;38;5;69mNo bookmarked named \033[1;38;5;196m$1\033[0m"
	exit 1
fi
