#!/bin/bash
#blattacks_stop.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME
#-------------------------------------------------------------------------------------------
blattacks_stop(){
	/opt/blattacks/src/./blattacks_status.sh 2> /dev/null > /dev/null
	if (( $? == 0 )); then
		for PID in $(ps aux | grep blattacks | grep -v -e grep -e $0 | awk '{print $2}'); do
			kill -9 $PID 2> /dev/null
		done
		echo "Blattacks was stopped."
	 	echo "$(date) - Blattacks stopped." >> $LOG
		exit 0
	else
		echo "Blattacks is not running."
		exit 1
	fi
}
blattacks_stop
