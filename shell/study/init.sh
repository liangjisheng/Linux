#!/bin/bash

param1=$1
echo "#!/bin/bash" > $1
echo "" >> $1
echo "# name  : $1" >> $1
echo "# author: liangjisheng" >> $1
echo "# time  : `date +"%Y-%m-%d %H:%M:%S"`" >> $1
echo "" >> $1
echo "" >> $1

echo "exit 0" >> $1
chmod u+x $1
