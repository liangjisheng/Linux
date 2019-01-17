#! /bin/bash
# total
# init variables
LOOP=0
TOTAL=0
COUNT=0

echo "Items Dept"
echo "____________"
while read DEPT ITEMS
do
	# keep a count on total records read
	COUNT=`expr $COUNT + 1`
	if [ "$DEPT" == "GIFT" ]
	then
		# keep a running total
		TOTAL=`expr $TOTAL + $ITEMS`
		ITEMS=`expr $ITEMS + 1`
		echo -e "$ITEMS\t$DEPT"
	fi
done < totalNum.txt

echo "============"
echo "$TOTAL"
echo "There were $COUNT entries altogether in the file"
