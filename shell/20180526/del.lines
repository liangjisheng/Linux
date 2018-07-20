#! /bin/bash
# 这个脚本可以处理一个或多个文件。每个文件在用sed删除空行之前要先核实是否存在。
# sed的输出被导入一个文件名中含有 $ $的临时文件，最后这个临时文件又被移回到原来的文件中

# del.lines
# script takes filename(s) and delete all blank lines

TEMP_F=/tmp/del.lines.$$
usage()
{
	echo "Usage: `basename $0` file [file..]"
	echo "try `basename $0` -help for more info"
	exit 1
}

if [ $# -eq 0 ]
then
	usage
fi

FILE=$1
while [ $# -gt 0 ]
do
	echo "..$1"
	case $1 in
	-help)
		cat <<MAYDAY
Use this script to delete all blank lines from a text files(s)
MAYDAY
		exit 0
		;;
	*)
		FILE_NAME=$1
		if [ -f $1 ]
		then
			sed '/^$/d' $FILE_NAME >$TEMP_F
			mv $TEMP_F $FILE_NAME
		else
			echo "`basename $0` cannot find this file: $1"
		fi
		shift
		;;
	esac
done
