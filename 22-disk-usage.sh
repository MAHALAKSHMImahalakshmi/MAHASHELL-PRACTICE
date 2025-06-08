#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 # in project it will be 75 here jusdt for checkking purpse
MSG="" # EMPTY MSG FIRST INTIALIZATION 
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
while IFS= read line
do 
      USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
      PARTITION=$(echo $line | awk '{print $7F}')
        echo "$PARTITION: $USAGE"

        if [  $USAGE -ge  $DISK_THRESHOLD  ]
        then
            MSG+="High Disk Usage on $PARTITION: $USAGE <br>"
        fi
done <<< $DISK_USAGE

echo -e $MSG
 
 sh mail.sh "Devops_TEAM" "High disk usage" $IP $MSG "rsmahalakshmi2002@gmail.com" "ALERT high disk usage" 