#! /bin/bash
# ifdirec
# assigning $1 to DIRECTORY variable
DIRECTORY=$1
if [ "`ls -A $DIRECTORY`" == "" ]
then
	echo "$DIRECTORY is indeed empty"
else
	echo "$DIRECTORY is not empty"
fi
