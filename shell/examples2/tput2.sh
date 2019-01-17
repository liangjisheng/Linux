#! /bin/bash
STATUS_LINE=`tput hs`
if $STATUS_LINE
then
	echo "your terminal has a status line"
else
	echo "your terminal has no status line"
fi

BELL=`tput bel`
CLEAR=`tput clear`

echo $BELL
# echo $CLEAR

echo "@"
echo -e "\100"
