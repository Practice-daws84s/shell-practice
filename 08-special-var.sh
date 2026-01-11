#!/bin/bash

echo "All variables passed through the script: $@"
echo "No of variables: $#"
echo "Script Name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"