#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "user is not root ,it is $USER, pls change acesss to root user of script $0"
    exit 1
else
    echo "user is root user of script :  $0"
fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo "$2 successfull installed "
    else
        echo "$2 not successfull installed "
        exit 1
    fi
     
}

    dnf list installed mysql
    if [ $? -eq 0 ]
    then
        echo "MYSQL already installed "
    else
        dnf install mysql -y
    
        VALIDATE $? "MYSQL"
    fi


    dnf list installed python
    if [ $? -ne 0 ]
    then 
        dnf install python -y
        VALIDATE $? python
    else
        echo "python already installed"
    fi



dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...Nothing to do"
fi