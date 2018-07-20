#! /bin/bash
# ifpass
# set the variables to false
INVALID_USER=yes
INVALID_PASSWD=yes
# save the current stty settings
SAVEDSTTY=`stty -g`
echo "You are logging into a sensitive area"
echo -n "Enter your ID name: "
read NAME
# hide the characters typed in 
stty -echo
echo "Ente your password: "
read PASSWORD
# back on again
stty $SAVEDSTTY
if [ "$NAME" == "ljs" ] || [ "$NAME" == "ljs1" ]
then
	# if a valid then set variable
	INVALID_USER=no
fi

if [ "$PASSWORD" == "ljs" ]
then
	INVALID_PASSWD=no
fi

if [ "$INVALID_USER" == "yes" -o "$INVALID_PASSWD" == "yes" ]
then
	echo "`basename $0` Sorry wrong password or userid"
	exit 1
fi

# if we get here then their ID and psssword are OK.
echo "correct user id and password given"
