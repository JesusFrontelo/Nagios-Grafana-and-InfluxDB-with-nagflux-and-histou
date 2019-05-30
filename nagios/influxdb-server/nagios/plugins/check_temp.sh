#!/bin/bash

GET_TEMPERATURE=`cat /sys/class/thermal/thermal_zone*/temp`
CHECK_TEMPERATURE=`expr $GET_TEMPERATURE / 1000`
OUTPUT="CPU is ${CHECK_TEMPERATURE}ºC. | cpu_temp=${CHECK_TEMPERATURE}"
case $CHECK_TEMPERATURE in
[1-70]*)
		echo "OK - ${OUTPUT}"
		exit 0
		;;
[71-80]*)
		echo "WARNING - ${OUTPUT}"
		exit 1
		;;
[81-100]*)
		echo "CRITICAL - ${OUTPUT}"
		exit 2
		;;
*)
		echo "UNKNOWN - ${OUTPUT}"
		exit 3
		;;
esac
