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
            echo "mysql is not  installed pls check error"
        else
            echo "mysql is  installed now   "
            
        fi

    else
        echo "mysql already installed  ....."
        
    fi
    
else 
    echo "not root user plds change access"
    exit 1
fi

