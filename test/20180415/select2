#!/bin/bash
# 虽然select本身就是循环，但不建议用他的循环,因为select虽然循环
# 却不再显示菜单，只循环输入，所以seleckt语句干脆直接用break，
# 只执行一次，在其上另配while循环

while echo "display current netconfig:"
do
	select vi in "ifconfig -a" "hosts" "netmasks" "quit"
	do
		case $vi in
		"ifconfig -a") /sbin/ifconfig -a;;
		"hosts") more hosts;;
		"netmasks") more netmasks;;
		"quit") break;;
		*) continue;;
		esac

		break
	done

# echo "$vi"
if [ "$vi" = "quit" ]
then
	break
fi
done
