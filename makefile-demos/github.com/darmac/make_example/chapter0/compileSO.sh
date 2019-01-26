#!/bin/bash

# 将 multi_div.c编译成动态链接库
gcc multi_div.c multi_div.h -fPIC -shared -o libmulti_div.so
# 使用file查看 libmulti_div.so
# file libmulti_div.so

exit 0
