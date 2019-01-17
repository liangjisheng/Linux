#! /bin/bash
# copyfile
FILENAME=myfile.txt
FILENAME_BAK=myfile.bak

# 如果文件存在且不为空
if [ -s $FILENAME ]
then
	# open FILENAME for reading
	# open FILENAME_BAK for writing
	exec 4>$FILENAME_BAK
	exec 3<$FILENAME

	# loop forever until no nore data and thus an error so we are at end of file
	while :
	do
		read LINE <&3
		if [ "$?" -ne 0 ]
		then
			# error then close up
			exec 3<&-
			exec 4<&-
			exit
		fi
		
		# write to FILENAME_BAK
		echo $LINE >&4
	done
else
	echo "`basename $0`: Sorry, $FILENAME is not present or is empty" >&2
fi
