#!/bin/bash

# 将add_minus.o打包到静态库中
# 实际上libxxx.a只是将指定的.o文件打包汇集在一起
ar rc libadd_minus.a add_minus.o

exit 0
