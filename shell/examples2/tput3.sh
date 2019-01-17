#! /bin/bash
# 可以用tput将光标放在屏幕任意位置。格式为：cup r c
xy()
{
	# _R=row, _C=column
	_R=$1
	_C=$2
	tput cup $_R $_C
}

clear
xy 1 5
echo -n "Enter your name: "
read NAME
xy 2 5
echo -n "Enter your age: "
read AGE
