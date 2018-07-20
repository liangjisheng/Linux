#! /bin/bash
whois()
# to call: whois userid
{
	# check we have the right param
	if [ $# -lt 1 ]
	then
		echo "whois: need user id's please"
		return 1
	fi

	for loop
	do
		_USER_NAME=`grep $loop /etc/passwd | awk -F: '{print $4 " " $5}'`
		if [ "$_USER_NAME" == "" ]
		then
			echo "whois: Sorry cannot find $loop"
		else
			echo "$loop is $_USER_NAME"
		fi
	done
}

whois ljs asdf peter
