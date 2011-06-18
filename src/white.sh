#!/bin/bash
#white.sh

source /etc/blattacks.conf

IP=$1
PORT=$2

#write code to block both
#with and without port

iptables -A $WHITE_CHAIN -p tcp -s $IP --dport $PORT -j ACCEPT

exit 0
