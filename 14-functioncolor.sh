#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[35m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR : Does not have user access $N"
    exit 1
else
    echo -e "Its is root access $G Proceed $N "
fi


VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e " $2 not successfull installed $R Error pls check $N "
        exit 1
    else
        echo -e "$2 $G succesfully installed $N"
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]
then 
        echo -e " $G MYSQL is not installed ..... $Y it is installing $N"
        dnf install mysql -y
        VALIDATE $? "mysql"
else
    echo -e "  $G MYSQL already installed  $Y sucess $B great job $N next"
fi