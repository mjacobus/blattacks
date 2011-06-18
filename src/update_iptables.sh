#!/bin/bash
#update_iptables.sh

source /etc/blattacks.conf
BLACK_LIST=$LOG_DIR/$BLACK_LIST_NAME
IP=$1
PORT=$2

grep "\b$IP\b" $BLACK_LIST | grep "$PORT" > /dev/null
     if (( $? != 0 )); then
          /opt/blattacks/src/./black_list.sh $IP $PORT
          #./black_list.sh $IP $PORT
     
          /opt/blattacks/src/./block.sh $IP $PORT
	  /opt/blattacks/src/./log_block.sh $IP $PORT
          #./block.sh $IP $PORT
     fi
exit 0
