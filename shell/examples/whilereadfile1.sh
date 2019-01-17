#! /bin/bash
# whilereadfile_1
# initialise variables
SAVEDIFS=$IFS
IFS=:
HOLD_FILE=hold_file
NAME_MATCH="James Lenod"
INPUT_FILE=name.txt

# create a new HOLD_FILE each time, in case script is continuously run
while read NAME DEPT ID
do
	# echo all information into holdfile with redirection
	echo $NAME $DEPT $ID >> $HOLD_FILE
	# is it match ???
	if [ "$NAME" == "$NAME_MATCH" ]
	then
		# yes then nice exit
		echo "all entries up to and including $NAME_MATCH are in $HOLD_FILE"
		exit 0
	fi
done < $INPUT_FILE

# restore IFS
IFS=$SAVEDIFS
