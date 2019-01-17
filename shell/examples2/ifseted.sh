#! /bin/bash
# ifseted
# is the EDITOR set?

if [ -z $EDITOR ]
then
	echo "Your EDITOR environment is not set"
	echo "I will assume you want to use vim ..OK"
	echo -n "Do you wish to change it now? [y..n]: "
	read ANS

	# check for an upper or lower case 'y'
	if [ "$ANS" == "Y" ] || [ "$ANS" == "y" ]
	then
		echo "enter your editor type: "
		read EDITOR
		echo $EDITOR
		if [ -z $EDITOR ] || [ "$EDITOR" == "" ]
		then
			# if EDITOR not set and no value in variable EDITOR
			# then set it to vim
			echo "No, editor entered, using vim as default"
			EDITOR=vim
			export EDITOR
		fi
		
		# got a value use it for EDITOR
		EDITOR=$EDITOR
		export EDITOR
		echo "setting $EDITOR"
	else
		echo "Using vim as the default editor"
		EDITOR=vim
		echo $EDITOR
		export EDITOR
	fi
else
	echo "Using vim as the default editor"
	EDITOR=vim
	export EDITOR
fi
