#!/bin/bash
#blattacks_vsftp.sh

source /etc/blattacks.conf

BLACK_LIST=$LOG_DIR/$BLACK_LIST
WHITE_LIST=$LOG_DIR/$WHITE_LIST
#VSFTP_LOG=`grep -v \# /etc/vsftpd.conf | grep "\bvsftpd_log_file=" | cut -d"=" -f2 | awk '{print $1}'`
VSFTP_LOG=/var/log/vsftpd.log

grep drop_port /etc/vsftpd.conf > /dev/null
if (( $? == 0 )); then
	PORT=`grep "\bdrop_port" /etc/vsftpd.conf | cut -d"=" -f2`
else
	PORT=21
fi


get_date(){
	#TODAY=`date +%a\ %b\ %d`
TODAY=`tail -1 /var/log/messages | cut -c 1-6`
}


while : ; do
     get_date
     for IP in $(cat $VSFTP_LOG  | grep -v anonymous | grep "$TODAY" | grep incorrect | awk -F '[' '{print $3}' | awk -F \" '{print $2}' | uniq -d);do
     FAILS=$(cat $VSFTP_LOG | grep "$TODAY" | grep incorrect | grep "\b$IP\b" | wc -l)
	if (( $FAILS > $ALLOWED_FAILED_LOGIN_NO )); then
#		/opt/blattacks/src/./white.sh
		/opt/blattacks/src/./update_iptables.sh $IP $PORT
		#./update_iptables.sh $IP $PORT
	fi
	done
	sleep $RUNTIME
done
exit 0
