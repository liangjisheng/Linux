#! /bin/bash

# trap命令用来捕捉一个信号，信号是进程间通信的一种方式，可以简单
# 的使用trap命令捕捉并忽视一个信号，下面这个忽略INT(中断信号)
# INT信号是当用户在Shell中按Ctrl+C是被发送

trap 'echo "Type quit to exit"' INT

while [ "$input" != 'quit' ]
do
	read input
done
