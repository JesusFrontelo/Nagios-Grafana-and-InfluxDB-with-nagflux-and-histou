#!/bin/bash

CHECK_LINES=`systemctl status grafana-server | grep running | wc -l`
case $CHECK_LINES in
[1]*)
		echo "OK - Server Grafana correctly running | service_grafana=${CHECK_LINES}"
		exit 0
		;;
[0]*)
		echo "CRITICAL - Server Grafana is not running | service_grafana=${CHECK_LINES}"
		exit 2
		;;
*)
		echo "UNKNOWN - ${CHECK_LINES}"
		exit 3
		;;
esac
