#! /bin/bash

# until是while语句的另一种写法，出来测试条件相反

sum=0
number=1

until ! test $number -le 100
do
	sum=$[ $sum + $number ]
	let number=$number+1
done

echo "The summary is $sum"
