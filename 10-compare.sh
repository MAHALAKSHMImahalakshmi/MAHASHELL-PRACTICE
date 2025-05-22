#!/bin/bash

num1=$1
num2=$2
num3=$3
num4=$4
num5=$5
if [ $num1 -gt $num2 ]
then  
    echo " gt $num1 > $num2  "
else
    echo "lt $num1 > $num2 "
fi

if [ $num1 -lt $num2 ]
then  
    echo " lt $num1 < $num2  "
else
    echo "gt $num1 < $num2 "
fi

if [ $num3 -eq $num4 ]
then  
    echo " eq $num3 eq $num4 "
else
    echo " $num3 ne $num4 "
fi

if [ $num5 -ne $num4 ]
then  
    echo " eq $num5 eq $num4 "
else
    echo " $num4 ne $num5 "
fi

if [ ! $num3 -eq $num4 ]
then  
    echo " eq $num1 = $num2  "
else
    echo " $num3 ne $num4 "
fi