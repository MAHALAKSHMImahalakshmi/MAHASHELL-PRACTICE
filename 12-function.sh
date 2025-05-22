#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]
then 
    echo "user is not root ,it is $USER, pls change acesss to root user of script $0"
    exit 1
else
    echo "user is root user of script :  $0"

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo "$2 successfull installed "
    else
        echo "$2 not successfull installed "
        exit 1
     
}

dnf list installed mysql
if [ $? -eq 0 ]
then
    echo "MYSQL already installed "
else
    dnf install mysql
    VALIDATE() $? MYSQL