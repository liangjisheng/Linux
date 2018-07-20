#! /bin/bash
# 它将使用一个连续不断的while循环锁住终端
# lockit
# trap singals 2 3 and 15
trap "nice_try" 2 3 15

# get the device we are running on
TTY=`tty`

nice_try()
{
	# nice_try
	echo "Nice try, the terminal stays locked"
}

# save stty settings hide characters typed in for the password
SAVEDSTTY=`stty -g`
stty -echo
echo -n "Enter your password to lock $TTY: "
read PASSWORD
clear

while :
do
	# read from tty only!!
	read RESPONSE < $TTY
	if [ "$RESPONSE" == "$PASSWORD" ]
	then
		# password matches..unlocking
		echo "unlocking..."
		break
	fi

	# show this if the user inputs a wrong password
	# or hits return 
	echo "wrong password and terminal is locked.."
done

# restore stty settings
stty $SAVEDSTTY
