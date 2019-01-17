#! /bin/bash

# Shell中的循环结构有3种：while、until、for

sum=0
number=1

while test $number -le 100
do
	sum=$[ $sum + $number ]
	let number=$number+1
done

echo "The summary is $sum"
