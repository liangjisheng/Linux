#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:29:03
# version : 1.0

# 使用=~来检测字符串是否符合某个正则表达式
read -p "input your telephone number:" tel

if [[ $tel =~ ^1[0-9]{10}$ ]]
then
    echo "your number is: $tel"
else
    echo "not a number."
fi

exit 0
