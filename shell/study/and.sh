#!/bin/bash

# name  : and.sh
# author: liangjisheng
# time  : 2018-12-28 00:12:36

touch file_one
rm -f file_two

if [ -f file_one ] && echo "hello" && [ -f file_two ] && echo " there"
then
    echo "in if"
else
    echo "in else"
fi

exit 0
