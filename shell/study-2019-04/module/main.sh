#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/16 10:31:15
# version : 1.0

# source 是 Shell 内置命令的一种，它会读取 filename 文件中的代码，
# 并依次执行所有语句.你也可以理解为，source命令会强制执行脚本文件中的全部命令
# 而忽略脚本文件的权限
# Shell source 命令和 C/C++ 中的 #include 类似，都没有避免重复引入的功能，
# 只要你使用一次 source，它就引入一次脚本文件中的代码
# 我们可以在模块中额外设置一个变量，使用 if 语句来检测这个变量是否存在，
# 如果发现这个变量存在，就 return 出去
source module.sh
source module.sh

echo "here executed"

exit 0
