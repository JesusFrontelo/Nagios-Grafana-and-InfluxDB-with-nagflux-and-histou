#!/bin/bash

date >> /usr/local/nagios/var/milog.log
echo "$1 $2 $3 $4 $5" >> /usr/local/nagios/var/milog.log
case $1 in
	OK)
	  ;;

	WARNING)
	  ;;

	CRITICAL)
		case $2 in
			SOFT)
				echo "Restarting service InfluxDB..." >> /usr/local/nagios/var/milog.log
				/usr/lib/nagios/plugins/check_nrpe -H $4 -p 5666 -c morninghook
				exit 0
			;;

			HARD)
				echo "Waking up service InfluxDB..." >> /usr/local/nagios/var/milog.log
				/usr/lib/nagios/plugins/check_nrpe -H $4 -p 5666 -c morningglory
				exit 0
			;;
		esac
	;;

	UNKNOWN)
	;;
esac

