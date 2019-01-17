#! /bin/bash
# trap1
# 下面的例子一经运行就开始计数直至用户按<Ctrl-C>信号2）
# 这时该脚本将会显示出当前的循环数字，然后退出
trap "my_exit" 2
LOOP=0

my_exit()
{
	clear
	echo "You just hit <CTRL-C>, at number $LOOP"
	echo " I will now exit"
	exit 1
}

while :
do
	LOOP=`expr $LOOP + 1`
	echo $LOOP
done
