#! /bin/bash
# trap_ignore
# ignore the signal
trap "" 1 2 3 15
LOOP=0

my_exit()
{
	echo "Received interrupt on count $LOOP"
	echo "Now exiting..."
	exit 1
}

# critical processing, cannot be interrupted....
LOOP=0
while :
do
	LOOP=`expr $LOOP + 1`
	echo "critical processing..$LOOP..you cannot interrupt me"
	sleep 1
	if [ "$LOOP" -eq 10 ]
	then
		break
	fi
done

LOOP=0
# critical processing finished, now set trap again but this time allow
# interrupts
trap "my_exit" 1 2 3 15

while :
do
	LOOP=`expr $LOOP + 1`
	echo "Non-critical processing..$LOOP..interrupt me now if you want"
	sleep 1
	if [ "$LOOP" -eq 10 ]
	then
		break
	fi
done
