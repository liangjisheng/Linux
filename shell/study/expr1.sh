#!/bin/bash

# name  : expr1.sh
# author: liangjisheng
# time  : 2019-01-06 23:32:45

echo `expr 10 + 10`
echo `expr 20 - 10`
echo `expr 20 / 2`
echo `expr 20 \* 2`

echo ""
echo `expr match "123 456 789" ".*5"`
echo `expr substr " this is a test" 3 5`
echo `expr index "test for the game" "e"`
echo `expr length "this is a test"`

exit 0
