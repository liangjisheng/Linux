#! /bin/bash

# read a char
read_a_char()
{
	# save the setting
	SAVEDSTTY=`stty -g`
	# set terminal raw please
	stty cbreak
	# read and output only one character
	dd if=/dev/tty bs=1 count=1 2>/dev/null
	# restore terminal and restore stty
	stty -cbreak
	stty $SAVEDSTTY
}

echo -n "Hit Any Key To Continue"
character=`read_a_char`
echo "In case you are wondering you pressed $character"
