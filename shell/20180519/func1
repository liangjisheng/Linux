#! /bin/bash
# func1
# 输出脚本参数的个数
echo $#
hello()
{
	echo "Hello there today's date is `date`"
}

echo "now going to the function hello"
# 所有函数使用前必须定义，否则shell解释器找不到
hello
echo "back from the function"

if [ $? == 0 ]
then
	echo "All is ok"
else
	echo "Something went wrong"
fi
