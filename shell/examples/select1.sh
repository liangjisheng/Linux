#!/bin/bash

echo "What is you favorite OS?"
printf "test"
printf "\n"
select var in "Linux" "Gnu Hurd"  "Free BSD" "Other" "quit"
do
	echo "you have selected $var"
	if [ "$var" = "quit" ]
	then
		break
	fi
done
