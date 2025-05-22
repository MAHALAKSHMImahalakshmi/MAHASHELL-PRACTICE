#!/bin/bash
USERID =$(id-u)
if [ USERID -ne 0 ]
then 
        echo " not root user "
else :
    echo " root user "
