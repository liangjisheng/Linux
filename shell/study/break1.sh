#!/bin/bash

# name  : break1.sh
# author: liangjisheng
# time  : 2019-01-08 23:30:39

for ((i=1;i<=10;i=i+1))
do
    if [ "$i" -eq 4 ]
    then
        break
    fi
    echo "$i"
done

exit 0
