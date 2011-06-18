#!/bin/bash
#log_block.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME

IP=$1
PORT=$2

#echo "$(date) - The IP address $IP had the destination port $PORT blocked on this server." >> $LOG

TIMES=$(grep "\b$IP\b" /var/log/messages | grep ailed | wc -l)

echo "$(date) - The IP address $IP had the destination port $PORT blocked on this server after $TIMES attepmts of breaking in." >> $LOG

exit 0
