#! /bin/bash
number_file()
# number_file
# to call: number_file filename
{
	_FILENAME=$1
	# check we have the right param
	if [ $# -ne 1 ]
	then
		echo "number_file: I need a filename to number"
		return 1
	fi

	loop=1
	while read LINE
	do
		echo "$loop: $LINE"
		loop=`expr $loop + 1`
	done < $_FILENAME
}

number_file $1
