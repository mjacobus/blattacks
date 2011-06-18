#!/bin/bash
#blattacks.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME
#-------------------------------------------------------------------------------------------
blattacks_restart(){
	
	/opt/blattacks/src/./blattacks_status.sh 2>&1
	
	if (( $? == 0 )); then
        	/opt/blattacks/src/./blattacks_stop.sh
        fi
	sleep 1
		/opt/blattacks/src/./blattacks_start.sh
	sleep 1

}
blattacks_restart
