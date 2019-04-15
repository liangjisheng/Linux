#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:48:11
# version : 1.0

# select 循环
# 注意，select 是无限循环（死循环），输入空值，或者输入的值无效，
# 都不会结束循环，只有遇到 break 语句，或者按下 Ctrl+D 组合键才能结束循环

echo "What is your favorite OS?"
select name in "Linux" "Windows" "Mac OS" "UNIX" "Android"
do
    echo $name
done
echo "You have selected $name"

exit 0
