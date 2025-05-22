#!/bin/bash

echo "All var passed into script : $@"
echo "NO of var in the script : $#"
echo "Name of the script : $0"
echo "Present working dir : $PWD "
echo "home dir of the user who is running the script $HOME"
echo "User dir of the running script : $USER"
echo "PID of the script : $$"
sleep 10 &
echo "PID of the last immediate process/command  : $!"
