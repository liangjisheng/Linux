#!/usr/bin/awk -f
# all comment line must start with a hash '#'
# name: student_tot.awk
# to call: student_tot.awk grade.txt
# prints total and average of club student points

# print a header first
BEGIN{
print "Student	Date	Member	No.	Grade	Age	Points	Max"
print "Name	Joined					Gained	Point Available"
print "========================================================================"


}
# let's add the scores of point gained
(tot += $6)

# finished processing now let's print the total and average point
END{print "Club student total points: " tot
	print "Average Club Student points: " tot/NR}
