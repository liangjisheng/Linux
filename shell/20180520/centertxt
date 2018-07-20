#! /bin/bash
# name: centertxt
# to call: centertxt num_line txt
# 在终端某一行的中间显示文本

xy()
{
	# _R=row, _C=column
	_R=$1
	_C=$2
	tput cup $_R $_C
}


centertxt()
{
	_ROW=$1
	_STR=$2
	# quick way of getting length of string
	LEN=`echo $_STR | wc -c`
	COLS=`tput cols`
	echo $COLS
	_NEW_COL=`expr \( $COLS - $LEN \) / 2`
	echo $_NEW_COL
	xy $_ROW $_NEW_COL
	echo $_STR
}

clear
centertxt 15 "THE MAIN EVENT"
