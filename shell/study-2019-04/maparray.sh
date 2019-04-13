#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/13 18:15:59
# version : 1.0

# 不同于普通数组，关联数组必须使用带有-A选项的 declare 命令创建
declare -A color
color["red"]="#ff0000"
color["green"]="#00ff00"
color["blue"]="#0000ff"
color["white"]="#ffffff"
color["black"]="#000000"

#获取所有元素值
for value in ${color[*]}
do
    echo $value
done
echo "****************"

#获取所有元素下标（键）
for key in ${!color[*]}
do
    echo $key
done
echo "****************"

#列出所有键值对
for key in ${!color[*]}
do
    echo "${key} -> ${color[$key]}"
done

exit 0
