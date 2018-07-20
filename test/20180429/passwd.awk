#! /usr/bin/awk -f
# to call: passwd.awk /ect/passwd
# print out the first and fifth fields
BEGIN{
FS=":"}
{print $1, "\t", $5}
