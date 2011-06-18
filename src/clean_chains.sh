#!/bin/bash
#clean_chains.sh

source /etc/blattacks.conf

iptables -F $WHITE_CHAIN
iptables -F $CHAIN

exit 0
