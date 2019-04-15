#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:24:16
# version : 1.0

read -p "input first string:" str1
read -p "input second string:" str2

if [[ -z $str1 ]] || [[ -z $str2 ]] #不需要对变量名加双引号
then
    echo "字符串不能为空"
    exit 0
elif [[ $str1 < $str2 ]]    #不需要也不能对 < 进行转义
then
    echo "$str1 < $str2"
else
    echo "$str1 >= $str2"
fi

exit 0
