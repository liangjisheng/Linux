#!/usr/bin/awk -f
# check on how many fields in a file
# name: fieldcheck.awk
# to call: fieldcheck.awk MAX=n FS=<separator> filename
# 
NF==MAX{
print("line " NR " does not have " MAX " fields")
}
