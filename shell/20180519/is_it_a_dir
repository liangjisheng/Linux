#! /bin/bash
# is it a dir
is_it_a_directory()
{
	# is_it_a_directory
	# to call: is_it_a_directory directory_name
	if [ $# -lt 1 ]
	then
		echo "is_it_a_directory: i need an argument"
		return 1
	fi

	# is it a directory?
	_DIRECTORY_NAME=$1
	if [ ! -d _DIRECTORY_NAME ]
	then
		# no it is not
		return 1
	else
		# yes it is
		return 0
	fi
}

echo -n "enter destination directory: "
read DIREC
if is_it_a_directory $DIREC
then
	:
else
	echo "$DIREC does not exist, create it now?[y..n]"
	# commands go here to either create the directory or exit
fi
