#!/bin/bash
#check_files.sh

source /etc/blattacks.conf

BLACK_LIST=$LOG_DIR/$BLACK_LIST_NAME
WHITE_LIST=$LOG_DIR/$WHITE_LIST_NAME

#checks for the log directory and creates it if it doesnt exist
	if [ -d $LOG_DIR ]; then
		:
	else
		mkdir -p $LOG_DIR
	fi

#checks for the log file and creates it if it doesnt exist
	if [ -x $LOG_DIR/$LOG_NAME  ]; then
		:
	else
		touch $LOG_DIR/$LOG_NAME
	fi

	LOG=$LOG_DIR/$LOG_NAME

#checks for IP_BLOCKED_LIST and creates it if it doesnt exist
	if [ -r $BLACK_LIST ];then
		:
	else
		touch $BLACK_LIST
	fi

	if [ -r $WHITE_LIST ];then
		:
	else
		touch $WHITE_LIST
	fi
	
exit 0
