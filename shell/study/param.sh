#!/bin/bash

# name  : param.sh
# author: liangjisheng
# time  : 2019-01-01 23:14:27

# $*把所有的参数当一个整体
for i in "$*"
do
    echo "The parameter is: $i"
done

x=0

for y in "$@"
do
    echo "The parameter is: $y"
    x=$(($x+1))
done
echo "x is: $x"

exit 0
