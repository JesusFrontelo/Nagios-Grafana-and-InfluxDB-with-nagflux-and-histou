#!/bin/bash

CHECK_LINES=`systemctl status influxdb | grep running | wc -l`
case $CHECK_LINES in
[1]*)
		echo "OK - Server InfluxDB correctly running | service_influx=${CHECK_LINES}"
		exit 0
		;;
[0]*)
		echo "CRITICAL - Server InfluxDB is not running | service_influx=${CHECK_LINES}"
		exit 2
		;;
*)
		echo "UNKNOWN - ${CHECK_LINES}"
		exit 3
		;;
esac
