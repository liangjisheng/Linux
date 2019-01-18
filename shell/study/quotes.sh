#!/bin/bash

myvar="Hi there"

echo $myvar
echo "$myvar"
echo '$myvar'
echo \$myvar

echo Enter some text
read myvar

echo 'myvar' now equals $myvar
# 参数个数
echo $#
# 进程号
echo $$
# 脚本名
echo $0
# 所有参数名,使用IFS(域分隔符)分隔
echo $*
# 所有参数名, 使用空额分隔参数 
echo $@

# test命令判断一个文件是否存在
if test -f fred.c
then
    echo file fred.c exist
else
    echo file fred.c not exist
fi

# 也可以使用[]判断文件是否存在
if [ -f fred.c ]
then
    echo file fred.c exist
else
    echo file fred.c not exist
fi

exit 0
