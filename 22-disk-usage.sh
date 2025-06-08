#!/bin/bash

DISK_USAGE=$(df -hT | frep -v Filesystem)
DISK_THRESHOLD=1 # in project it will be 75 here jusdt for checkking purpse
MSG="" # EMPTY MSG FIRST INTIALIZATION 
while IFS= read line
do 
      USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
      PARTITION=$(echo $line | awk '{print $7F}')
        echo "$PARTITION: $USAGE"

        if [ $USAGE -ge $DISK_THRESHOLD]
        then
            MSG+="High Disk Usage on $PARTITION: $USAGE \n"
        fi
done <<< $DISK_USAGE

echo -e $MSG
 