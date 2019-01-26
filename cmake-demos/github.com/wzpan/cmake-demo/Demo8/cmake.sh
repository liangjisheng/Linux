#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/01/26 11:55:04
# version : 1.0

cmake -G "Unix Makefiles" -S . -B build
cd build
make
# make clean

exit 0
