#! /bin/bash
# ifeditor
# 测试变量是否为空
if [ -z $EDITOR ]
then
	echo "Your $EDITOR environment is not set"
else
	echo "Using $EDITOR as the default editor"
fi
