#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/01/18 16:47:03
# version : 1.0

make -f neq.mk

make -f neq.mk a=1

make -f neq.mk a=2

make -f neq.mk a="hello"

exit 0
