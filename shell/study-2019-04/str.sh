#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/13 10:35:13
# version : 1.0

str="testtest"
echo -n "string $str length is:"
echo ${#str}

nums=(29 100 13)
# 输出整个数组， 下面两句等价
echo ${nums[*]}
echo ${nums[@]}

# 输出数组个数
echo ${#nums[*]}

nums[10]="http://c.biancheng.net/shell/"
echo ${#nums[@]}
echo ${#nums[10]}

# 删除数组元素
unset nums[1]
echo ${#nums[*]}

# exit 0
