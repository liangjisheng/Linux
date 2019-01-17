#! /bin/bash
# caserep
echo "		Weekly Report"
echo -n "What day do you want to run report [Saturday] :"

# if just a return is hit then except default which is Saturday
read WHEN
# 如果没有设置WHEN，则使用默认值Saturday
echo "validating..${WHEN:="Saturday"}"

case $WHEN in
	Monday|MONDAY|mon)
	;;
	Sunday|SUNDAY|sun)
	;;
	Saturday|SATURDAY|sat)
	;;
	*)
	echo " Are you nuts!, this reprot can only be run on " >&2
	echo " on a Saturday, Sunday or Monday" >&2
	exit 1
	;;
esac

echo "Report to run on $WHEN"
# command here to submitted actual report run
