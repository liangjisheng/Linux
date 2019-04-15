#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 20:05:58
# version : 1.0

function getsum() {
    local sum=0 #局部变量
    for((i=$1; i<=$2; i++))
    do
        ((sum+=i))
    done

    echo $sum
    return $?
}

read -p "input a num:" m
read -p "input a num:" n

echo "The sum is "$(getsum $m $n)

# 代码中总共执行了两次 echo 命令，但是却只输出一次，这是因为$()捕获了第一个
# echo 的输出结果，它并没有真正输出到终端上。除了$()，你也可以使用``来捕获
# echo 的输出结果

exit 0
