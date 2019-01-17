#! /bin/bash
# ifcounter
COUNTER=100
echo "Do you wish to change the counter value currently set at $COUNTER ?[y..n]: "
read ANS
if [ "$ANS" == "y" ] || [ "$ANS" == "Y" ]
then
	# yes user wants to change the value
	echo "Enter a sensible value "
	read VALUE
	# simple test to see if it's numeric, add any number to VALUE, then check out return 
	expr $VALUE + 10 > /dev/null 2>&1
	STATUS=$?
	# check return code of the expr
	if [ "$VALUE" == "" ] || [ "$STATUS" != 0 ]
	then
		# send errors to standard error
		echo "You either entered nothing or a non-numeric " >&2
		echo "Sorry now exiting..counter stay at $COUNTER" >&2
		exit 1
	fi

	# if we are here, then it's a number, so add it to COUNTER
	COUNTER=`expr $COUNTER + $VALUE`
	echo "Counter now set to $COUNTER"
else
	# if we are here then user just hit return instead of entering a number or answered n to the change a value prompt
	echo "Counter statys at $COUNTER"
fi
