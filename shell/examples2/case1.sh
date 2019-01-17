#! /bin/bash
# getopt1
# to call: getopt1 -a -h
# to call: getopt1 -a -h -p

# set the vars
ALL=false
HELP=false
FILE=false
VERBOSE=false

while getopts ahfgv OPTION
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
	esac
done
