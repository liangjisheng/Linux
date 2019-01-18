#!/bin/bash

# name  : trap1.sh
# author: liangjisheng
# time  : 2018-12-31 12:07:52

trap 'rm -f /tmp/my_tmp_file_$$' INT
echo creating fiel /tmp/my_tmp_file_$$
date > /tmp/my_tmp_file_$$

echo "press interrupt (CTRL-C) to interrupt ...."
while [ -f /tmp/my_tmp_file_$$ ]; do
    echo File exists
    sleep 1
done
echo The file no longer exists

trap INT
echo creating file /tmp/my_tmp_file_$$
date > /tmp/my_tmp_file_$$

echo "press interrupt (CTRL-C) to interrupt ..."
while [ -f /tmp/my_tmp_file_$$ ]; do
    echo File exists
    sleep 1
done

exit 0
