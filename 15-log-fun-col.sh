#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USERID=$(id -u)
LOG_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f 1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

 mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR : Does not have user access $N" &>>$LOG_FILE
    exit 1
else
    echo -e "Its is root access $G Proceed $N "  &>>$LOG_FILE
fi


VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e " $2 not successfull installed $R Error pls check $N " &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 $G succesfully installed $N" &>>$LOG_FILE
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then 
        echo -e " $G MYSQL is not installed ..... $Y it is installing $N" &>>$LOG_FILE
        dnf install mysql -y
        VALIDATE $? "mysql"
else
    echo -e "  $G MYSQL already installed  $Y success $B great job $N next" &>>$LOG_FILE
fi