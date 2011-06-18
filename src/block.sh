#!/bin/bash
#block.sh

source /etc/blattacks.conf
LOG=$LOG_DIR/$LOG_NAME

IP=$1
PORT=$2

iptables -A $CHAIN -p tcp -s $IP --dport $PORT -j DROP
#/opt/blattacks/src/./log_block.sh $IP $PORT

#echo "$(date) - IP $IP had its port(s) $PORT blocked on this server." >> $LOG

exit 0
