#!/bin/bash

CHECKUSER=`check_iostat -u | cut -d" " -f6 | cut -d"." -f1`
CHECKUSER2=`check_iostat -u | cut -d" " -f6`

CHECKSYSTEM=`check_iostat -s | cut -d" " -f6 | cut -d"." -f1`
CHECKSYSTEM2=`check_iostat -s | cut -d" " -f6`

CHECKIOWAIT=`check_iostat -i | cut -d" " -f4 | cut -d"." -f1`
CHECKIOWAIT2=`check_iostat -i | cut -d" " -f4`

CHECKFREE=`check_iostat -f | cut -d" " -f4 | cut -d"." -f1`
CHECKFREE2=`check_iostat -f | cut -d" " -f4`

CHECK2=`expr ${CHECKUSER2} + ${CHECKSYSTEM2} + ${CHECKIOWAIT2}`
CHECK=`expr ${CHECKUSER} + ${CHECKSYSTEM} + ${CHECKIOWAIT}`

output="CPU ussage is ${CHECK}% | 'cpu_user'=${CHECKUSER2}%;80;90; 'cpu_system'=${CHECKSYSTEM2}%;80;90; 'cpu_iowait'=${CHECKIOWAIT2}%;80;90; 'cpu_free'=${CHECKFREE2}%;20;10;"

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
