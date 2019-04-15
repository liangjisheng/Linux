#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/14 11:20:09
# version : 1.0

if
    read -t 20 -sp "Enter password in 20 seconds(once) > " pass1 && 
    printf "\n" &&
    read -t 20 -sp "Enter password in 20 seconds(again) > " pass2 &&
    printf "\n" &&
    [ $pass1 == $pass2 ]
then
    echo "Valid password"
else
    echo "Invalid password"
fi

exit 0
