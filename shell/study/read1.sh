#!/bin/bash

# name  : read1.sh
# author: liangjisheng
# time  : 2019-01-06 23:19:42

exec 3< and.sh

# read the file using fd #3
count=0
while read -u 3 var
do
    let count=$count+1
    echo "Line $count:$var"
done
echo "finished"
echo "Line no is $count"

# Close fd #3
exec 3<&-

echo ""

count1=0
while read line
do
    let count1=$count1+1
    echo "Line $count1:$line"
done < and.sh

echo "finished"
echo "Line no is $count1"

exit 0
