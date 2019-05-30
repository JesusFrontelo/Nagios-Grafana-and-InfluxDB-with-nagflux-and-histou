#!/bin/bash

CHECK=`check_iostat -f | cut -d" " -f4 | cut -d"." -f1`
CHECK2=`check_iostat -f | cut -d" " -f4`
output="CPU FREE is ${CHECK2}% | cpu_free=${CHECK2}"

if [ -z ${CHECK} ]; then
	echo "UNKNOWN - ${output}"
	exit 3
elif [ ${CHECK} -ge 20 ]; then
	echo "OK - ${output}"
	exit 0
elif [ ${CHECK} -ge 10 ]; then
	echo "WARNING - ${output}"
	exit 1
else
	echo "CRITICAL - ${output}"
	exit 2
fi
