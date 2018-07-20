#! /bin/bash
# whileread_cond
# initialise variables
ACC_LOOP=0
CUS_LOOP=0
PAY_LOOP=0
SAVEDIFS=$IFS
IFS=:

while read NAME DEPT ID
do
	# increment counter for each matched dept.
	case $DEPT in
		Accounts)
			ACC_LOOP=`expr $ACC_LOOP + 1`
			ACC="Accounts"
			;;
		Customer)
			CUS_LOOP=`expr $CUS_LOOP + 1`
			CUS="Customer"
			;;
		Payroll)
			PAY_LOOP=`expr $PAY_LOOP + 1`
			PAY="Payroll"
			;;
		*)
			echo "`basename $0`: Unknown department $DEPT" >&2
			;;
	esac
done < name.txt

# restore IFS
IFS=$SAVEDIFS

echo "threr are $ACC_LOOP employees assigned to $ACC dept"
echo "threr are $CUS_LOOP employees assigned to $CUS dept"
echo "threr are $PAY_LOOP employees assigned to $PAY dept"
