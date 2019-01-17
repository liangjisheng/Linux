#! /bin/bash

continue_prompt()
# continue_prompt
# to call: continue_prompt "string to display" default_answer
{
	_STR=$1
	_DEFAULT=$2
	# check we have the right params
	if [ $# -lt 1 ]
	then
		echo "continue_prompt: I need a string to display"
		return 1
	fi

	# loop forever
	while :
	do
		echo -n "$_STR [Y..N] [$_DEFAULT]:"
		read _ANS
		# if user hits return set the default and determine the return value that's a :then a <space> then $
		: ${_ANS:=$_DEFAULT}
		if [ "$_ANS" == "" ]
		then
			case $_ANS in
			Y) return 0 ;;
			N) return 1 ;;
			esac
		fi

		# user has select something
		case $_ANS in 
		y|Y|Yes|YES)
			return 0
			;;
		n|N|No|NO)
			return 1
			;;
		*)
			echo "Answer either Y or N, default is $_DEFAULT"
			;;
		esac

		echo $_ANS
	done
}

if continue_prompt "Do you want to delete the var filesystem" "N"
then
	echo "Are you nuts!!"
else
	echo "Phew!, what a good answer"
fi
