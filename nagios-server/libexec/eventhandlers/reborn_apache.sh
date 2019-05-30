#!/bin/bash

date >> /usr/local/nagios/var/milog.log
echo "$1 $2 $3 $4 $5" >> /usr/local/nagios/var/milog.log
case $1 in
	OK)
	;;

	WARNING)
	;;

	CRITICAL)
		/usr/lib/nagios/plugins/check_nrpe -H $4 -p 5666 -c reborn
	;;

	UNKNOWN)
	;;
esac

