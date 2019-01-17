#! /bin/bash

for i in 1 2 3 4 5 6 7 8 9
do
	echo $i
done

for i in `seq 9`
do
	echo $i
done


# ls会返回当前目录的文件列表，统计当前目录下文件的个数
count=0

for file in `ls`
do
	if ! [ -d $file ]
	then
		let count=$count+1
	fi
done

echo "There are $count files"
