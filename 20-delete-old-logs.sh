#!/bin/bash
USERID=$(id -u)
R="\e[31M"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript-logs" # inorder to create /var and rm dir need soudo access so check_root function
SCRIPT_NAME=$(echo $0 | cut -d "." -fl)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"


# first whant to learn about souce dir where all files are stored 
SOURCE_DIR=/home/ec2-user/app-logs

mkdir -p $LOG_FOLDER
#check_root
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    if
}



echo "Srcript started executed at $(date)"
# find command to find  log file 14 days before one
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)



while IFS= read -r filepath
do 
echo "deleating $filepath" | tee -a $LOG_FILE
    rm -rf $filepath

done <<< $FILES_TO_DELETE # from this input file  <<<  [ input sting ]

echo "script executed successfully $(date) done.."