#! /bin/bash
# termput
# init tput for your terminal
tput init

clear
echo "tput <> terminfo"
infocmp -l $TERM | while read LINE
do
	case $LINE in
	bel*) 
		echo "$LINE: sound the bell" 
		;;
	blink*) echo "$LINE: begin blinking mode" ;;
	bold*) echo "$LINE: make it bold" ;;
	el*) echo "$LINE: clear to end of line" ;;
	civis*) echo "$LINE: turn cursor off" ;;
	clear*) echo "$LINE: clear the screen" ;;
	kcuul*) echo "$LINE: up arrow" ;;
	kcubl*) echo "$LINE: left arrow" ;;
	kcufl*) echo "$LINE: right arrow" ;;
	kcudl*) echo "$LINE: down arrow" ;;
	# *) echo "unknown" ;;
	esac
done
