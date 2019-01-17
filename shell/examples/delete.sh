#!/bin/bash

# 建立回收站机制
# 将需要删除的文件移动倒~/.trash中

if [ ! -d ~/.trash ]
then
	mkdir ~/.trash
fi

if [ $# -eq 0 ]
then
	# 提示delete的用法
	echo "Usage: delete file1 [file2 file3 ...]"
else
	echo "You are about to delete these files:"
	echo $@

	#要求用户确认是否删除这些文件，回答N或n放弃删除，其他字符表示确认
	# -n取消echo末尾的换行
	echo -n "Are you sure to do that? [Y/n]:"
	read reply

	if [ "$reply" != "n" ] && [ "$reply" != "N" ]
	then 
		for file in $@
		do
			# 判读文件或目录是否存在
			if [ -f "$file" ] || [ -d "$file" ]
			then
				mv -b "$file" ~/.trash/
			else
				echo "$file: No such file or directory"
			fi
		done
	# 如果用户回答N或n
	else
		echo "No file removed"
	fi
fi
