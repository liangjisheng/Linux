#! /bin/bash
# getopt1
# to call: getopt1 -ah -c
# to call: getopt1 -ah -c 3

# set the vars
ALL=false
HELP=false
FILE=false
VERBOSE=false
COPIES=0		# the value for the -c option is set to zero

while getopts :ahfgvc: OPTION
do
	case $OPTION in
	a)
		echo "OPTION is $OPTION"
		ALL=true
		echo "ALL is $ALL"
		;;
	h)
		echo "OPTION is $OPTION"
		HELP=true
		echo "HELP is $HELP"
		;;
	f)
		echo "OPTION is $OPTION"
		FILE=true
		echo "FILE is $FILE"
		;;
	v)
		echo "OPTION is $OPTION"
		VERBOSE=true
		echo "VERBOSE is $VERBOSE"
		;;
	c)
		COPIES=$OPTARG
		echo "COPIES is $COPIES"
		;;
	\?)
		# usage statement
		echo "`basename $0` -[a h f v] -[c value] file" >&2
		;;
	esac
done
