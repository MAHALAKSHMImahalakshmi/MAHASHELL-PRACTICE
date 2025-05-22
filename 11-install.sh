#!/bin/bash

USERID=$(id -u)

echo "using $USERID -eq 0  "
if [ $USERID -eq 0 ]
then 
        echo "   root user "
else :
    echo " not root user "
fi


echo "using $USERID -ne 0  "

if [ $USERID -ne 0 ]
then 
        echo " not  root user "
else :
    echo "  root user "
fi