#! /bin/bash
# ifinteractive
# -t选项确定脚本是交互模式(终端模式)还是非交互模式(cron,at)
# 返回1为交互模式
if [ -t ]
then
	echo "We are interactive with af terminal"
else
	echo "We must be running from some background process probably cron or at"
fi
