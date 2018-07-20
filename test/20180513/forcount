#! /bin/bash
# forcount
# 前面讨论expr时指出，循环时如果要加入计数，使用此命令
# 下面使用ls在for循环中列出文件及其数目
counter=0
for files in *
do
	# increment
	counter=`expr $counter + 1`
done

echo "There are $counter files in `pwd` we need to process"
echo

WHOS_ON=`who -u | awk '{print $1}'`
for user in $WHOS_ON
do
	echo "current user $user"
done
