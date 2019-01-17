#! /bin/bash
# breakout
# while: means loop forever
while :
do
	echo -n "Enter any number [1..5]: "
	read ANS
	case $ANS in
	1|2|3|4|5)
		echo "great you entered a number between 1 and 5"
		;;
	*)
		echo "Wrong number..bye"
		break
		;;
	esac
done
