#! /bin/bash
# ifelif
echo -n "enter your login name: "
read NAME
# no name entered do not carry on
if [ -z $NAME ] || [ "$NAME" == "" ]
then
	echo "You did not enter a name"
elif
	# is the name root
	[ "$NAME" == "root" ]
then
	echo "Hello root"
elif [ "$NAME" == "ljs" ]
then
	echo "Hello ljs"
elif [ "$NAME" == "dave" ]
then
	echo "Hello dave"
else
	# no it's somebody else
	echo "You are not root or ljs or dave but hi $NAME"
fi
