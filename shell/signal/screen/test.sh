#!/bin/bash

# 两种退出方法
# 1.当前会话不要了，输入exit命令，就相当于杀死了当前会话进程,不会进行session保存
# 2.先同时按Ctrl+A然后按D键

sudo apt-get install screen

# 新建会话
screen -S name

# 在会话中执行长时间操作
# 退出会话

# 重新连接会话
screen -r id
screen -r name

# 列出当前所有session
screen -ls 