#!/bin/bash

echo "Is it morning? Please answer yes or no"
read timeofday

case "$timeofday" in
    yes) echo "Good Morning";;
    no ) echo "Good Afternoon";;
    Y  ) echo "Good Morning";;
    n  ) echo "Good Afternoon";;
    *  ) echo "Sorry, answer not recognized";;
esac


echo "Is it morning? Please answer yes or no"
read timeofday

case "$timeofday" in
    yes | y | Yes | YES ) echo "Good Morning";;
    n* | N* )             echo "Good Afternoon";;
    * )                   echo "Sorry, answer not recognized"
                          exit 1
    ;;

esac

exit 0
