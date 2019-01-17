#! /bin/bash
# tr_case
# convert files to either upper or lower case
FILES=""
TRCASE=""
EXT=""
OPT=no

# gets called when a conversion fails
error_msg()
{
	_FILENAME=$1
	echo "`basename $0`: Error the conversion failed on $_FILENAME"
}

# case conversion
usage()
{
	# usage
	echo "usage: `basename $0` -[l|u] file [files]" >&2
	exit 1
}

if [ $# -eq 0 ]
then
	# no parameters passed!
	# usage
	echo "For more info try `basename $0` --help"
	exit 1
fi

while [ $# -gt 0 ]
do
	case $1 in
	-U)
		TRCASE=upper
		EXT=".UC"
		OPT=yes
		shift
		;;
	-l)
		TRCASE=lower
		EXT=".LC"
		OPT=yes
		shift
		;;
	--help)
		echo "convert a file(s) to uppercase from lowercase"
		echo "convert a files(s) from lowercase to uppercase"
		echo "will convert all characters according to the"
		echo " specified command option."
		echo " Where option is"
		echo " -l Convert to lowercase"
		echo " -u Convert to uppercase"
		echo " The original files(s) is not touched. A new file(s)"
		echo "will be created with either a .UC or .LC extension"
		echo "usage: $0 -[l|u] file [file...]"
		exit 0
		;;
	-*)
		echo "usage: `basename $0` -[l|u] file [file..]"
		exit 1
		;;
	*)
		# collect the files to process
		if [ -f $1 ]
		then 
			# add the filenames to a variable list
			FILES=$FILES" "$1
		else
			echo "`basename $0`: Error cannot find the file $1"
		fi
		shift
		;;
	esac
done

# no options gived ... help the user
if [ "$OPT" == "no" ]
then
	echo "`basename $0`: Error you need to specify an option. No action taken"
	echo "try `basename $0` --help"
	exit 1
fi

# now read in all the file(s)
# use the variable LOOP, Ijust love the wrod LOOP
for LOOP in $FILES
do
	case $TRCASE in
	lower)
		cat $LOOP | tr "[a-z]" "[A-Z]" >$LOOP$EXT
		if [ $? != 0 ]
		then
			error_msg $LOOP
		else
			echo "Convert file called $LOOP$EXT"
		fi
		;;
	upper)
		cat $LOOP | tr "[A-Z]" "[a-z]" >$LOOP$EXT
		if [ $? != 0 ]
		then
			error_msg $LOOP
		else
			echo "Convert file called $LOOP$EXT"
		fi
		;;
	esac
done
