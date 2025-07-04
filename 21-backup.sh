#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # IF DAYS PROVIDED CONSIDER OT ELSE days - optional default 14 days



USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/backup.log"

mkdir -p $LOG_FOLDER




if [ $USER_ID -ne 0 ]
then
echo -e "$R ERROR:: Please run this script with root access $N" 
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" 
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

USAGE(){
 echo -e " $R USAGE:: $N sh backup.sh <souce_dir > <dest-dir> <days> (optional for days ) "
}

#check arguments
if [ $# -lt 2 ]
then 
USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R ERROR : $N SOURCE directory  $SOURCE_DIR does not exist. Please check $N"
    exit 1
fi


if [ ! -d $DEST_DIR ]
then
    echo -e "$R ERROR : $N destination directory  $DEST_DIR does not exist. Please check $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z "$FILES" ] #check variable is empty if nothing files varible to check empy -z if not then !-z
then
    echo "Files to zip are: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "$FILES" | tr ' ' '\n' | zip -@ "$ZIP_FILE"

    if [ -f $ZIP_FILE ] # file exit if true delete  or      not  fo to else so not zip file exit
       #  error because download # sudo dnf install zip -y
    then
        echo -e "Successfully created Zip file"

            while IFS= read -r filepath
            do
                echo "Deleting $filepath " | tee -a $LOG_FILE
                rm -rf $filepath
            done <<< $FILES

            echo -e "Log files older than $DAYS from source directory removed ... $G SUCCESS $N"

    else
             echo -e "$R ERROR  Zip file failure creation $N"
             exit 1
    fi
    
else

    echo -e "No log files found older than 14 days ... $Y SKIPPING $N"
fi