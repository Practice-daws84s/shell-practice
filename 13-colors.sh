#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
else
    echo "You are running with root access"
fi

#Validate function takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
        then 
            echo -e "Installing $2 is ... $G SUCCESS $N"
        else
            echo -e "Installing $2 is ... $G FAILURE $N"
            exit 1
        fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "mysql"
else
    echo -e "MySQL is $Y already installed $N...Nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "msql"
else
    echo -e "python3 is $Y already installed $N...Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "msql"
else
    echo -e "nginx is $Y already installed $N...Nothing to do"
fi