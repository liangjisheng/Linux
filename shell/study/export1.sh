#!/bin/bash

# name  : export1.sh
# author: liangjisheng
# time  : 2018-12-28 00:44:29

foo="The first"
export bar="The second"

# 调用脚本export2
exec ./export2.sh

exit 0
