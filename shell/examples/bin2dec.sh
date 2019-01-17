#!/bin/bash
# 将二进制数转换为相应的十进制数
# vim: set sw=4 ts=4 et:
help()
{
	cat<<HELP
b2d -- convert binary to decimal
USAGE: b2d [-h] binarynum
OPTIONS: -h help text
EXAMPLE: b2d 111010
will return 58
HELP
	exit 0
}

error()
{
	# print an error and exit
	echo $1
	exit 1
}

lastchar()
{
	# return the last character of a string in $rval
	if [ -z "$1" ]
	then
		# empty string
		rval=""
		return
	fi

	# wc puts some sapce behind the output this is why we need sed:
	numofchar=`echo -n "$1" | wc -c | sed 's/ //g'`
	# now cut out the last char
	rval=`echo -n "$1" | cut -b $numofchar`
}

chop()
{
	# remove the last character in string and return it in $rval
	if [ -z "$1" ]
	then
		# empty string
		rval=""
		return
	fi
	
	# wc puts some sapce behind the output this is why we need sed:
	numofchar=`echo -n "$1" | wc -c | sed 's/ //g'`
    echo $numofchar
	if [ "$numofchar" = "1" ]
	then
		# only one char in string
		rval=""
		return
	fi

	numofcharminus1=`expr $numofchar "-" 1`
    echo $numofcharminus1
	# now cut all but the last char:
	rval=`echo -n "$1" | cut -b 0-${numofcharminus1}`
    echo $rval
}

while [ -n "$1" ]
do
	case $1 in
	-h) help; shift 1;;		# function help is called
	--) shift; break;;		# end of options
	-*) error "error:no such option $1. -h for help";;
	*) break;;
	esac
done

# The main program
sum=0
weight=1
# one arg must be gived
[ -z "$1" ] && help
binnum="$1"
binnumorig="$1"

while [ -n "$binnum" ]
do
	lastchar "$binnum"
	if [ "$rval" = "1" ]
	then
        echo $sum
		sum=`expr "$weight" "+" "$sum"`
	fi

    echo $binnum
	# remove the last position in $binnum
	chop "$binnum"
	binnum="$rval"
	weight=`expr "$weight" "*" 2`
done

echo "binary $binnumorig is decimal $sum"
