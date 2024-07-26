#!/usr/bin/env bash

# Finder script for assignment 1
# Author: Vineet Yadav

# set -e

USGSTR="Total number of arguments should be 2.\nThe order of arguments should be:\n  1) Path to the files directory.\n  2) String to searched in the specified files directory.\n"
FILESDIR=""
SEARCHSTR=""
NUMFILES=0
NUMLINES=0

if [ $# -ne 2 ]
then
	echo "ERROR: Invalid number of arguments."
	echo -e ${USGSTR}
	exit 1
else
	if [ -d $1 ]
	then
		FILESDIR=$1
		SEARCHSTR=$2
	else
		echo "ERROR: Invalid arguments. 1st argument files directory does not exist."
		echo -e ${USGSTR}
		exit 1
	fi
fi	

NUMFILES=$(find ${FILESDIR} -type f | wc -l)
for item in "$(find ${FILESDIR} -type f)"; do
	NUMLINES=$(cat $(echo "$item") | grep $2| wc -l)
done

echo "The number of files are ${NUMFILES} and the number of matching lines are ${NUMLINES}"
