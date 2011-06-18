#!/bin/bash
#create_chain.sh

source /etc/blattacks.conf
	iptables -L INPUT -n | grep "$CHAIN" > /dev/null
     if (( $? != 0 ));then
          iptables -L -n | grep Chain | grep "$CHAIN" > /dev/null
          if (( $? != 0 )); then                       #if $CHAIN exists else nothing
               iptables -t filter -N $CHAIN
          fi
          #place $CHAIN in INPUT position 1
          iptables -L INPUT -n --line-numbers | grep -v Chain | grep "$CHAIN" > /dev/null
          if (( $? == 0 )); then
               RULE-NUMBER=$(iptables -L INPUT -n --line-numbers | grep "$CHAIN" | head -n 1 | awk '{print $1}')
                    if (( $RULE-NUMBER != 1 ));then
                         iptables -t filter -D INPUT $RULE-NUMBER
                    fi
               fi
         iptables -t filter -I INPUT -j $CHAIN
     fi

#/opt/blattacks/src/./create_white_chain.sh

exit 0
