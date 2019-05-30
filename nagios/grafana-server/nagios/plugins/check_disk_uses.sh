#!/bin/bash

### ======================================================================= ###
###     A nagios plugin to check disk uses for given disk or mountpoint     ###
###     Uses: ./check_disk_uses.sh /                                        ###
###           ./check_disk_uses.sh /mnt                                     ###
###           ./check_disk_uses.sh /dev/sda1                                ###
### ======================================================================= ###

### ======================================================================= ###
###                         FUNCTIONS                                       ###
### ======================================================================= ###

calculate_disk_uses(){
	USED_DISK_SPACE=`df -h ${MOUNT_POINT} | grep -v Filesystem | awk '{print $5}' | sed 's/%//g'`
	OUTPUT="${USED_DISK_SPACE}% of disk space used | used_per=${USED_DISK_SPACE}"
	case ${USED_DISK_SPACE} in
		[1-80]*)
			echo "OK - ${OUTPUT}"
			exit 0
		;;
		[81-85]*)
			echo "WARNING - ${OUTPUT}"
			exit 1
		;;
		[86-100]*)
			echo "CRITICAL - ${OUTPUT}"
			exit 2
		;;
		*)
			echo "UNKNOWN - ${OUTPUT}"
			exit 3
		;;
	esac
}

### ======================================================================= ###
###                         SCRIPT EXECUTION START HERE                     ###
### ======================================================================= ###

if [[ -z "$1" ]]
then
        echo "Missing parameters! Syntax: ./`basename $0` mount_point/disk"
        exit 3
else
        MOUNT_POINT=$1
fi

calculate_disk_uses

### ======================================================================= ###
###                         END OF SCRIPT                                   ###
### ======================================================================= ###
