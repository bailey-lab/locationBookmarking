#!/bin/bash

#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo "Takes only one argument, name for bookmark for the location to delete"
	echo "eg. removeLocation.sh bookmarkName"
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
	echo -e "No bookmarked location save as $1"
fi
