#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:18:42
# version : 1.0

read -p "input first string:" str1
read -p "input second string:" str2

# 检测字符串是否为空
if [ -z "$str1" -o -z "$str2" ]
then
    echo "字符串不能为空"
    exit 0
fi

if [ "$str1" == "$str2" ]
then
    echo "equal"
else
    echo "not equal"
fi

exit 0
