#!/bin/bash
#create_white_chain.sh

source /etc/blattacks.conf
iptables -L $CHAIN -n | grep "$WHITE_CHAIN" > /dev/null
     if (( $? != 0 ));then
          iptables -L -n | grep Chain | grep "$WHITE_CHAIN" > /dev/null
          if (( $? != 0 )); then                       #if $WHITE_CHAIN exists else nothing
               iptables -t filter -N $WHITE_CHAIN
          fi
          
	iptables -L $CHAIN -n --line-numbers | grep -v Chain | grep "$WHITE_CHAIN" > /dev/null
          if (( $? == 0 )); then
               RULE-NUMBER=$(iptables -L $CHAIN -n --line-numbers | grep "$WHITE_CHAIN" | head -n 1 | awk '{print $1}')
                  if (( $RULE-NUMBER != 1 ));then
                        iptables -t filter -D $CHAIN $RULE-NUMBER
	          fi
          fi
	iptables -t filter -I $CHAIN -j $WHITE_CHAIN
     fi

#iptables -t filter -I $CHAIN -j $WHITE_CHAIN
exit 0
