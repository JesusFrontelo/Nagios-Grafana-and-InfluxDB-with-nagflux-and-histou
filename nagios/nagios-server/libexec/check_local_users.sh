#!/bin/bash

USUARIOS=`who | wc -l`
OUTPUT="Logged in ${USUARIOS} | users_in=${USUARIOS}"

if [ -z ${USUARIOS} ]; then
	echo "UNKNOWN - ${OUTPUT}"
	exit 3
elif [ ${USUARIOS} -le 5 ]; then
	echo "OK - ${OUTPUT}"
	exit 0
elif [ ${USUARIOS} -le 7 ]; then
	echo "WARNING - ${OUTPUT}"
	exit 1
else
	echo "CRITICAL - ${OUTPUT}"
	exit 2
fi
