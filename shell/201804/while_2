#! /bin/bash

echo -n "Enter a number(>0):"
while read n
do
	sum=0
	count=1

	if [ $n -gt 0 ]
	then
		while [ $count -le $n ]
		do
			sum=$[ $sum + $count ]
			let count=$count+1
		done
		echo "The summary is $sum"
	else
		echo "Please enter a number greater than zero"
	fi
	
	echo -n "Enter a number(>0):"
done
