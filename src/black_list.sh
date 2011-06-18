#!/bin/bash
#black_list.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME
BLACK_LIST=$LOG_DIR/$BLACK_LIST_NAME

IP=$1
PORT=$2

echo $IP:$PORT >> $BLACK_LIST && \
echo "$(date) - IP $IP Was black listed." >> $LOG

exit 0