#!/bin/bash

num1=$1
num2=$2

sum=$(($num1+$num2))
echo "sum of $num1 and $num2 = $sum"
sub=$(($num1-$num2))
echo "sub of $num1 and $num2 = $sub"
mul=$(($num1*$num2))
echo "mul of $num1 and $num2 = $mul"
div=$(($num1/$num2))
echo "div of $num1 and $num2 = $div"


