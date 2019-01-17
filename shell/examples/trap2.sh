#! /bin/bash
# trap2
# trap only signal 2...<CTRL-C>

# 脚本在运行时不断使用df和ps命令向临时文件HOLD1.$$和HOLD2.$$中写入相应
# 的信息
trap "my_exit" 2
HOLD1=HOLD1.$$
HOLD2=HOLD2.$$

my_exit()
{
	# my_exit
	echo "<CTRL-C> detected.. Now cleaning up..wait"
	# delete the temp files
	rm *.$$ 2> /dev/null
	exit 1
}

echo "processing..."
# loop forever, do some processing
while :
do
	df >> $HOLD1
	ps xa >> $HOLD2
	sleep 1
done
