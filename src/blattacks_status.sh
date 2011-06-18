#!/bin/bash
#blattacks_status.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME
#-------------------------------------------------------------------------------------------
blattacks_status(){
	ps aux | grep blattacks | grep -v -e grep -e $0 -e stop -e blattacks.sh -e status -e start > /dev/null
	if (( $? == 0 )); then
		echo "Blattacks is running."
		exit 0
	else
		echo "Blattacks is not running."
		exit 1 
	fi
}
blattacks_status
