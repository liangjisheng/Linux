#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 18:56:25
# version : 1.0

# read -p "input your age:" age

printf "input your age:"
read age

if (( $age <= 2 ))
then
    echo "baby"
elif (( $age >= 3 && $age <= 8 ))
then
    echo "baby1"
elif (( $age >= 9 && $age <= 17 ))
then
    echo "teenager"
elif (( $age >= 18 && $age <= 25 ))
then
    echo "adult"
elif (( $age >= 26 && $age <= 40 ))
then
    echo "青年"
elif (( $age >= 41 && $age <= 60 ))
then
    echo "中年"
else
    echo "老年"
fi

exit 0
