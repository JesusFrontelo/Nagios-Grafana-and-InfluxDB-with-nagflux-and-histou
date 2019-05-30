#!/bin/bash

CHECK=`check_iostat -s | cut -d" " -f6 | cut -d"." -f1`
CHECK2=`check_iostat -s | cut -d" " -f6`
output="CPU ussage by SYSTEM is ${CHECK2}% | cpu_system=${CHECK2}"

if [ -z ${CHECK} ]; then
	echo "UNKNOWN - ${output}"
	exit 3
elif [ ${CHECK} -le 70 ]; then
	echo "OK - ${output}"
	exit 0
elif [ ${CHECK} -le 80 ]; then
	echo "WARNING - ${output}"
	exit 1
else
	echo "CRITICAL - ${output}"
	exit 2
fi
