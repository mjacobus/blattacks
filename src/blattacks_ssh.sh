#!/bin/bash
#blattacks_ssh.sh

source /etc/blattacks.conf

#PORT=$(grep -v \# /etc/ssh/sshd_config | grep Port) && echo $(grep "\bPort\b" /etc/ssh/sshd_config | grep -v \# | awk '{print $2}') || \
PORT=22
#PORT=22


get_date(){
	TODAY=`tail -1 /var/log/messages | cut -c 1-6`
	#TODAY=`date +%b\ %d`
}

grep sshd /var/log/messages | grep "fff:" > /dev/null
if (( $? == 0 )); then
	while : ; do
	get_date
	for IP in $(grep sshd /var/log/messages | grep "$TODAY" | grep -i Illegal | awk -F"fff:" '{print $2}' | awk '{print $1}' | sort -d | uniq);do
#	for IP in $(grep sshd /var/log/messages | grep "$TODAY" | grep Illegal | awk -F"fff:" '{print $2}' | awk '{print $1}' | sort -d | uniq);do
		FAILED=$(grep sshd /var/log/messages | grep "$TODAY" | grep -i illegal | grep "\b$IP\b" | wc -l)
#		FAILED=$(grep sshd /var/log/messages | grep "$TODAY" | grep -i illegal | grep "\b$IP\b" | nl | tail -n1 | awk '{print $1}')
		if (( $FAILED > $ALLOWED_FAILED_LOGIN_NO )); then
#			/opt/blattacks/src/./white.sh
			/opt/blattacks/src/./update_iptables.sh $IP $PORT
			#./update_iptables.sh $IP $PORT
		fi
		done
		sleep $RUNTIME
	done
fi

grep sshd /var/log/messages | grep -i "from " > /dev/null
if (( $? == 0 )); then
	while : ; do
	get_date
	for IP in $(grep sshd /var/log/messages | grep "$TODAY" | grep Failed | awk -F "from " '{print $2}' | awk '{print $1}' | sort -d | sort -u);do
		FAILED=$(grep sshd /var/log/messages | grep "$TODAY" | grep Failed | grep "\b$IP\b" | wc -l)
#		FAILED=$(grep sshd /var/log/messages | grep "$TODAY" | grep Failed | grep "\b$IP\b" | nl | awk '{print $1}' | tail -n1)
		if (( $FAILED > $ALLOWED_FAILED_LOGIN_NO )); then
#			/opt/blattacks/src/./white.sh	
			/opt/blattacks/src/./update_iptables.sh $IP $PORT
			#./update_iptables.sh $IP $PORT
		fi
		done
		sleep $RUNTIME
	done
fi


grep sshd /var/log/secure | grep "from " > /dev/null
if (( $? == 0 )); then
	while : ; do
	get_date
	for IP in $(grep sshd /var/log/secure | grep "$TODAY" | grep Failed | awk -F "from " '{print $2}' | awk '{print $1}' | sort -d | sort -u);do
		FAILED=$(grep sshd /var/log/secure | grep "$TODAY" | grep Failed | grep "\b$IP\b" | wc -l)
#		FAILED=$(grep sshd /var/log/secure | grep "$TODAY" | grep Failed | grep "\b$IP\b" | nl | awk '{print $1}' | tail -n1)
		if (( $FAILED > $ALLOWED_FAILED_LOGIN_NO )); then
#			/opt/blattacks/src/./white.sh
			/opt/blattacks/src/./update_iptables.sh $IP $PORT
			#./update_iptables.sh $IP $PORT
		fi
		done
		sleep $RUNTIME
	done
fi



exit 0
