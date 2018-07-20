#!/usr/bin/awk -f
# name: age.awk
# to call: age.awk AGE=N grade.txt
# print ages that are lower than the age supplied on the command line
{if ($5 < AGE) print $0}
