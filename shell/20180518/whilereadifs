#! /bin/bash
# whilereadifs
# save the setting of IFS
SAVEDIFS=$IFS
# assign new separator to IFS
IFS=:
while read NAME DEPT ID
do
	echo -e "$NAME\t $DEPT\t $ID"
done < name.txt

# restore the settings of IFS
IFS=$SAVEDIFS
