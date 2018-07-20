#! /bin/bash
# grepif
# grep匹配成功返回0， 失败返回1
if grep 'Dave\>' scores.txt > /dev/null 2>&1
then
	echo "Great Dave is in the file"
else
	echo "No Dave is not in the file"
fi

echo -n "Enter a list of names: "
read list
if echo $list | grep "ljs" > /dev/null 2>&1
then
	echo "ljs is here"
else
	echo "ljs is not in the list. No comment"
fi
