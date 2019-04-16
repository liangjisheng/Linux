#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/16 17:55:13
# version : 1.0

# 所谓代码块，就是由多条语句组成的一个整体
# 将重定向命令放在代码块的结尾处，就可以对代码块中的所有命令实施重定向

sum=0
while read n; do
    ((sum += n))
done <nums.txt  #输入重定向
echo "sum=$sum"

sum=0
while read n; do
    ((sum += n))
    echo "this number: $n"
done <nums.txt >log.txt  #同时使用输入输出重定向
echo "sum=$sum"

# 对{}包围的代码使用重定向
{
    echo "C语言中文网";
    echo "http://c.biancheng.net";
    echo "7"
} >log.txt #输出重定向

{
    read name;
    read url;
    read age
} <log.txt #输入重定向

echo "$name已经$age岁了，它的网址是 $url"

exit 0
