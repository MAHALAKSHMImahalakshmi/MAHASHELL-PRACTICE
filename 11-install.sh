#!/bin/bash
USERID=$(id -u)
if [ $USERID -eq 0 ]
then 
        echo "  root user "
else :
    echo " not root user "
fi