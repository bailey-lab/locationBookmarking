#!/bin/bash

#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo "\033[1;38;5;196mTakes only one argument, name for bookmark for the location to delete"
	echo "eg. removeLocation.sh bookmarkName\033[0m"
	exit
fi
# Check to see if bookmark name has already been used
check=$(egrep "^$1\>" $LOCBOOKHOME/.ohThePlacesIveBeen.txt)
if [ -n "$check" ]; then
	if [ $(uname) == "Darwin" ]; then
		gsed -i "/^$1\b/d" $LOCBOOKHOME/.ohThePlacesIveBeen.txt
	else 
	 	sed -i "/^$1\b/d" $LOCBOOKHOME/.ohThePlacesIveBeen.txt
	fi
else
	echo -e "\033[1;38;5;69mNo bookmarked location saved as \033[1;38;5;196m$1\033[0m"
fi
