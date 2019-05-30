#!/bin/bash

CHECK_LINES=`systemctl status apache2 | grep running | wc -l`
case $CHECK_LINES in
[1]*)
		echo "OK - Server Apache correctly running | service_apache=${CHECK_LINES}"
		exit 0
		;;
[0]*)
		echo "CRITICAL - Server Apache is not running | service_apache=${CHECK_LINES}"
		exit 2
		;;
*)
		echo "UNKNOWN - ${CHECK_LINES}"
		exit 3
		;;
esac
