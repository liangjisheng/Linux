#! /bin/bash

# 下面脚本在用户退出的时候显示Goodbye

trap 'echo "Goodbye"; exit' EXIT

echo "Type 'quit' to exit"

while [ "$input" != "quit" ]
do
	read input
done
