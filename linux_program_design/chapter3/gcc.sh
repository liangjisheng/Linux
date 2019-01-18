#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/01/18 23:05:54
# version : 1.0

FILENAME=${1%.*}
# EXTNAME=${1##*.}

gcc -o $FILENAME $1

exit 0
