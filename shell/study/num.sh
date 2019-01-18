#!/bin/bash

# name  : num.sh
# author: liangjisheng
# time  : 2019-01-01 23:33:31

aa=11
bb=22
cc=$(expr $aa + $bb)
echo $cc

#let dd=$aa+$bb
#echo $dd

ee=$(($aa+$bb))
echo $ee

exit 0
