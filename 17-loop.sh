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
    echo -e "$R ERROR : Does not have user access $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "Its is root access $G Proceed $N " | tee -a $LOG_FILE
fi

PACKAGEs=( "mysql" "python" "nginx" )

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e " $2 not successfull installed $R Error pls check $N " | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 $G succesfully installed $N" | tee -a $LOG_FILE
    fi

}



for package in  ${PACKAGEs[$@]}
do
        dnf list installed $package &>>$LOG_FILE
        if [ $? -ne 0 ]
        then 
            echo -e " $G $package is not installed ..... $Y it is installing $N" | tee -a $LOG_FILE
            dnf install $package -y &>>$LOG_FILE
            VALIDATE $? "$package"
         else
            echo -e "  $G $package already installed  $Y success $B great job $N next" | tee -a $LOG_FILE
        fi

done

