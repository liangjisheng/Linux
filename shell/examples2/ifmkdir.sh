#! /bin/bash
# ifmkdir
# parameter is passed as $1 but reassigned to DIRECTORY
DIRECTORY=$1

# 测试参数是否为空
if [ "$DIRECTORY" == "" ]
then
	echo "Usage: `basename $0` directory to create" >&2
	exit 1
fi

# 测试目录是否存在
if [ -d $DIRECTORY ]
then
	# do nothing
	:
else
	echo "The directory does not exist"
	echo -n "Create it now? [y..n]: "
	read ANS
	if [ $ANS == "y" ] || [ $ANS == "Y" ]
	then
		echo "creating now"
		# create directory and send all output to /dev/null
		mkdir $DIRECTORY >/dev/null 2>&1
		if [ $? != 0 ]
		then
			echo "Errors creating the directory $DIRECTORY" >&2
			exit 1
		fi
	else
		# do nothing
		:
	fi
fi
