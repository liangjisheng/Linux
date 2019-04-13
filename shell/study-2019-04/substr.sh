#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/13 18:26:00
# version : 1.0

# 截取字符串，从左边开始计数
# ${string: start :length}
url="c.biancheng.net"
echo ${url: 2: 9}
echo ${url: 2}  #省略 length，截取到字符串末尾

# 截取字符串，从右边开始计数
# ${string: 0-start :length}
echo ${url: 0-13: 9}
echo ${url: 0-13}  #省略 length，直接截取到字符串末尾

# 从左边开始计数时，起始数字是 0（这符合程序员思维）；从右边开始计数时，
# 起始数字是 1（这符合常人思维）。计数方向不同，起始数字也不同。
# 不管从哪边开始计数，截取方向都是从左到右

# 从指定字符（子字符串）开始截取字符串
# 这种截取方式无法指定字符串长度，只能从指定字符（子字符串）截取到字符串末尾。
# Shell 可以截取指定字符（子字符串）右边的所有字符，也可以截取左边的所有字符。

# 使用 # 号截取右边字符
# ${string#*chars}
# string 表示要截取的字符，chars 是指定的字符（或者子字符串），
# *是通配符的一种，表示任意长度的字符串。*chars连起来使用的意思是：
# 忽略左边的所有字符，直到遇见 chars（chars 不会被截取）
url="http://c.biancheng.net/index.html"
echo ${url#*:}
echo ${url#*p:}
echo ${url#*ttp:}

# 如果不需要忽略 chars 左边的字符，那么也可以不写*，例如：
echo ${url#http://}

# 如果希望直到最后一个指定字符（子字符串）再匹配结束，那么可以使用##
# ${string##*chars}
str="---aa+++aa@@@"
echo ${str#*aa}   #结果为 +++aa@@@
echo ${str##*aa}  #结果为 @@@

# 使用 % 截取左边字符
# 请注意*的位置，因为要截取 chars 左边的字符，而忽略 chars 右边的字符，
# 所以*应该位于 chars 的右侧。其他方面%和#的用法相同
echo ${url%/*}  #结果为 http://c.biancheng.net
echo ${url%%/*}  #结果为 http:
echo ${str%aa*}
echo ${str%%aa*}

exit 0
