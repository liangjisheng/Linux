#!/bin/bash

lockfile=/var/lock/subsys/myservice
touch $lockfile

# start
start() {
    if [ -e $lockfile ]; then
        echo "Service is already running....."
        return 0 
    else
        touch $lockfile
        echo "Service start ..."
        return 0
    fi
}

# stop
stop() {
    if [ -e $lockfile ]; then
        rm -f $lockfile
        echo "Service is stoped "
        return 0
    else
        echo "Service is not run"
        return 0 
    fi
}

# restart
restart() {
    stop
    start
}

usage() {
    echo "Usage:{start|stop|restart|status}"
}

status() {
    if [ -e $lockfile ]; then
        echo "Service is running .."
        return 0
    else
        echo "Service is stop"
        return 0
    fi
}

case $1 in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
status)
    status
    ;;
*)
    usage
    exit 0 
    ;;
esac

