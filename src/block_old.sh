#!/bin/bash
#block_old.sh


source /etc/blattacks.conf
WHITE_LIST=$LOG_DIR/$WHITE_LIST_NAME
BLACK_LIST=$LOG_DIR/$BLACK_LIST_NAME


for i in $(cat $WHITE_LIST);do
        IP=$(echo $i | cut -d":" -f1)
       # IP=`echo $i | cut -d":" -f1`
        #PORT=`echo $i | cut -d":" -f2-`
        PORT=$(echo $i | cut -d":" -f2-)
        /opt/blattacks/src/./white.sh $IP $PORT
done

for i in $(cat $BLACK_LIST);do
        IP=`echo $i | cut -d":" -f1`
        PORT=`echo $i | cut -d":" -f2-`
        /opt/blattacks/src/./block.sh $IP $PORT
done

exit 0
