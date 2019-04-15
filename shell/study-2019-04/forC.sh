#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:39:42
# version : 1.0

sum=0

for (( i=1; i<=100; i++))
do
    (( sum+=i ))
done

echo "The sum is: $sum"

exit 0
