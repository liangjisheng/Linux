#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:42:37
# version : 1.0

sum=0

for n in 1 2 3 4 5
do
    echo $n
    ((sum+=n))
done

echo "The sum is: $sum"

sum=0

for n in {1..100}
do
    ((sum+=n))
done

echo $sum

for filename in $(ls *.sh)
do
    echo "$filename"
done

exit 0
