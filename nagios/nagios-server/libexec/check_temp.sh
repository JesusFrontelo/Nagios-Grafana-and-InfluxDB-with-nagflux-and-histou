#!/bin/bash

GET_TEMPERATURE=`cat /sys/class/thermal/thermal_zone*/temp`
CHECK_TEMPERATURE=`expr $GET_TEMPERATURE / 1000`
output="CPU is ${CHECK_TEMPERATURE}ºC. | cpu_temp=${CHECK_TEMPERATURE}"

if [ -z ${CHECK_TEMPERATURE} ]; then
	echo "UNKNOWN - ${output}"
	exit 3
elif [ ${CHECK_TEMPERATURE} -le 70 ]; then
	echo "OK - ${output}"
	exit 0
elif [ ${CHECK_TEMPERATURE} -le 80 ]; then
	echo "WARNING - ${output}"
	exit 1
else
	echo "CRITICAL - ${output}"
	exit 2
fi
