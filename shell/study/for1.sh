#!/bin/bash

for foo in bar fud 43
do
    echo $foo
done

# 列出所有以f开头的 .sh结尾的文件
for file in $(ls f*.sh); do
    echo $file
done

exit 0
