#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 20:03:44
# version : 1.0

sum=0  #全局变量

function getsum() {
    for((i=$1; i<=$2; i++)); do
        ((sum+=i))  #改变全局变量
    done
    return $?  #返回上一条命令的退出状态
}

read -p "input a num:" m
read -p "input a num:" n

if getsum $m $n
then
    echo "The sum is $sum" #输出全局变量
else
    echo "error"
fi

# 这种方案的弊端是：定义函数的同时还得额外定义一个全局变量，
# 如果我们仅仅知道函数的名字，但是不知道全局变量的名字，那么也是无法获取结果的

exit 0
