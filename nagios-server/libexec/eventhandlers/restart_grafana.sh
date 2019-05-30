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
				case $3 in
					3)
						echo "Restarting service grafana..." >> /usr/local/nagios/var/milog.log
						/usr/lib/nagios/plugins/check_nrpe -H $4 -p 5666 -c rewakeup_grfn
						exit 0
					;;
				esac
			;;

			HARD)
				echo "Waking up service grafana..." >> /usr/local/nagios/var/milog.log
				/usr/lib/nagios/plugins/check_nrpe -H $4 -p 5666 -c wakeup_grfn
				exit 0
			;;
		esac
	;;

	UNKNOWN)
	;;
esac

