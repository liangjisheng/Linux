#! /bin/bash
chop()
# chop
# to call: chop string how_many_chars_to_chop
{
	_STR=$1
	_CHOP=$2
	# awk's substr starts at 0, we need to increment by one
	# to reflect when the user says (ie) 2 chars to be chopped it will be 2 chars off
	# and not 1
	_CHOP=`expr $_CHOP + 1`

	# check we have the right params
	if [ $# -ne 2 ]
	then
		echo "check_length: I need a string and how many characters to chop"
		return 1
	fi

	# check the length of the string first
	# we can't chop more than what's in th string!!
	_LENGTH=`echo $_STR | awk '{print length($0)}'`
	if [ "$_LENGTH" -lt "$_CHOP" ]
	then
		echo "Sorry you have asked to chop more characters than there are in the string"
		return 1
	fi

	# echo $1
	# echo $_STR
	# echo "$2"
	# echo $_CHOP
	echo $_STR | awk '{print substr($1, '$_CHOP')}'
}

CHOPPED=`chop "Honeysuckle" 5`
echo $CHOPPED
