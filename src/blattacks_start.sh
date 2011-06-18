#!/bin/bash
#blattacks_start.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME
#-------------------------------------------------------------------------------------------
blattacks_start(){
	/opt/blattacks/src/./blattacks_status.sh 2> /dev/null > /dev/null
	if (( $? == 1 )); then

		/opt/blattacks/src/./check_files.sh
		/opt/blattacks/src/./create_chain.sh
		/opt/blattacks/src/./create_white_chain.sh
		/opt/blattacks/src/./clean_chains.sh
		/opt/blattacks/src/./create_chain.sh
		/opt/blattacks/src/./create_white_chain.sh
		/opt/blattacks/src/./block_old.sh 
	
		if [ "$ENABLE_SSH" == "yes" ]; then
			/opt/blattacks/src/./blattacks_ssh.sh &
			echo "Blattacks SSH started."
			echo "$(date) - Blattacks SSH enabled." >> $LOG
			sleep 0.5
		fi	
	
		if [ "$ENABLE_VSFTP" == "yes" ]; then
			/opt/blattacks/src/./blattacks_vsftp.sh &
			echo "Blattacks VSFTP started."
			echo "$(date) - Blattack VSFTP enabled." >> $LOG
			sleep 0.5
		fi
		echo "Blattacks successfully started."
	else
		echo "Blattacks is already running."
		exit 1
	fi
}
blattacks_start
