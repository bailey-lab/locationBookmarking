#!/bin/bash

#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo "Takes only one argument, name for bookmark for current location"
	echo "eg. saveLocation.sh newBookmark"
	exit
fi
#Check to see if the file has been started yet and if hasn't add header
if [ ! -e $LOCBOOKHOME/.ohThePlacesIveBeen.txt ]; then
	echo -e "LocName\tLocation" >  $LOCBOOKHOME/.ohThePlacesIveBeen.txt
fi

# Check to see if bookmark name has already been used
check=$(egrep "^$1\>" $LOCBOOKHOME/.ohThePlacesIveBeen.txt)
if [ -n "$check" ]; then
    echo "Location Already Saved as "
    echo "$check"
else
	echo -e "$1\t$PWD" >>  $LOCBOOKHOME/.ohThePlacesIveBeen.txt
fi
