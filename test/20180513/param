#! /bin/bash
# name: param
echo "This is the script path		: $0"
echo "This is the script name		: `basename $0`"
echo "This is the first parameter	: $1"
echo "This is the second parameter	: $2"
echo "This is the third parameter	: $3"
echo "This is the fourth parameter	: $4"
echo "This is the fifth parameter	: $5"
echo "This is the sixth parameter	: $6"
echo "This is the seventh parameter	: $7"
echo "This is the eighth parameter	: $8"
echo "This is the ninth parameter	: $9"
echo
# 显示参数个数
echo "The number of arguments passed: $#"
# 以一个单字符串显示传递到脚本的参数，与位置变量不同，此选项参数可超过9个
echo "Show all arguments			: $*"
# 显示当前进程ID号
echo "Show me my process ID			: $$"

# 与$#相同，但是使用时加引号，并在引号中返回每个参数
echo "Show me the arguments in quotes: " "$@"

# 显示最后命令的退出状态。 0表示没有错误，其他任何值表明有错误
echo "Did my script go with any errors: $?"

# 显示shell使用的当前选项，与s e t命令功能相同
echo "shell options:	$_"
