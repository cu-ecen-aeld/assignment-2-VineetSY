#!/usr/bin/env bash

# Writer script for assignment 1
# Author: Vineet Yadav

# set -e

USGSTR="Total number of arguments should be 2.\nThe order of arguments should be:\n  1) Path to the file.\n  2) String to be written in the specified file.\n"
WRITEFILE=""
WRITESTR=""
NUMFILES=0
NUMLINES=0

if [ $# -ne 2 ]
then
	echo "ERROR: Invalid number of arguments."
	echo -e ${USGSTR}
	exit 1
else
    WRITEFILE=$1
    WRITESTR=$2
fi

if [ -f ${WRITEFILE} ]
then
    rm -f ${WRITEFILE}
    # if [ $? -eq 0 ]
    # then
    #     echo "Removing old file"
    # fi
fi

WRITEDIR=$(dirname ${WRITEFILE})

if [ ! -d ${WRITEDIR} ]
then
    # echo "${WRITEDIR} does not exist, creating it"
    mkdir -p ${WRITEDIR}
fi

touch ${WRITEFILE}
if [ $? -eq 0 ]
then
    echo ${WRITESTR} > ${WRITEFILE}
    # if [ $? -eq 0 ]
    # then
    #     cat ${WRITEFILE}
    # fi
fi