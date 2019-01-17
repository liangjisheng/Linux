#! /bin/bash
check_length()
# check_length
# to call: check_length string max_length_of_string
{
	_STR=$1
	_MAX=$2
	# check we have the right params
	if [ $# -ne 2 ]
	then
		echo "check_length: I need a string and max length the string should be"
		return 1
	fi

	# check the length of the string
	_LENGTH=`echo $_STR | awk '{print length($0)}'`
	if [ "$_LENGTH" -gt "$_MAX" ]
	then
		# length of string is too big
		return 1
	else
		# string is ok in length
		return 0
	fi
}

while :
do
	echo -n "Enter your FIRST name: "
	read NAME
	# 检查输入的名字最大长度不能超过10个
	if check_length $NAME 10
	then
		break
	else
		echo "The name field is too long 10 characters max"
	fi
done
