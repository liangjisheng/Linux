#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:36:03
# version : 1.0

i=1
sum=0

# 在(())中不需要加$符号
while (( i <= 100))
do
    (( sum+=i ))
    (( i++ ))
done

echo "The sum is: $sum"

exit 0
