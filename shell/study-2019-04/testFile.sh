#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:11:36
# version : 1.0

read -p "input filename:" filename
read -p "input a url:" url

# -n 判断字符串是否为非空
if test -w $filename && test -n $url
then
    echo $url > $filename
    echo "write success."
else
    echo "write failure."
fi

exit 0
