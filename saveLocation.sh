#!/bin/bash

#First check to see if there is only one argument
if [[ $# -ne 1 ]]; then
	echo -e "\033[1;38;5;196mTakes only one argument, name for bookmark for current location"
	echo -e "eg. saveLocation.sh newBookmark\033[0m"
	exit 1
fi
#Check to see if the file has been started yet and if hasn't add header
if [ ! -e $LOCBOOKHOME/.ohThePlacesIveBeen.txt ]; then
	echo -e "LocName\tLocation" >  $LOCBOOKHOME/.ohThePlacesIveBeen.txt
fi

# Check to see if bookmark name has already been used
check=$(egrep "^$1\>" $LOCBOOKHOME/.ohThePlacesIveBeen.txt)
if [ -n "$check" ]; then
    echo -e "\033[1;38;5;69mLocation Already Saved as "
    echo -e "\033[1;38;5;196m$check\033[0m"
    exit 1
else
  echo -e "$1\t$PWD" >>  $LOCBOOKHOME/.ohThePlacesIveBeen.txt
  echo -e "LocName\tLocation" >  $LOCBOOKHOME/.ohThePlacesIveBeenTemp.txt
  sed "1d" $LOCBOOKHOME/.ohThePlacesIveBeen.txt | sort >> $LOCBOOKHOME/.ohThePlacesIveBeenTemp.txt
  mv $LOCBOOKHOME/.ohThePlacesIveBeenTemp.txt $LOCBOOKHOME/.ohThePlacesIveBeen.txt 
fi
