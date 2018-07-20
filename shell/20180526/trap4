#! /bin/bash
# trap4
# trap signal 1 2 3 and 15
trap "my_exit" 1 2 3 15
LOOP=0

# temp files
HOLD1=HOLD1.$$
HOLD2=HOLD2.$$

# 如果用户并不希望退出，那么可以选择2或不做任何选择，此时case语句将
# 会使用户退回到脚本中原来的地方
my_exit()
{
	# my_exit
	echo -e "\nRecieved interrupt..."
	echo "Do you wish to really exit???"
	echo " Y: Yes"
	echo " N: No"
	echo -n "Your choice [Y..N] >"
	read ANS
	case $ANS in
	Y|y) exit 1 ;;		# exit the script
	N|n) ;;				# return no normal processing
	esac
}

# a while loop here perhaps for reading in fields
while :
do
	echo -n "Enter your name: "
	read NAME
	echo -n "Enter your age: "
	read AGE
	echo "name: $NAME, age: $AGE"
done
