#!/bin/bash

USERID=$(id -u)
if [ $USERID -eq 0 ]
then 
    echo "root user"
    
    dnf list installed mysql

    if [ $? -ne 0 ]
    then 
        echo "mysql not installed it is installing ....."

        dnf install mysql -y
        if [ $? -ne 0 ]
        then 
            echo "mysql is successfull installed"
        else
            echo "mysql is not  installed pls check error "
            exit 1
        fi

    else
        echo "mysql already installed  ....."
        exit 0
    fi
    
else 
    echo "not root user plds change access"
    exit 1
fi

echo "$?"