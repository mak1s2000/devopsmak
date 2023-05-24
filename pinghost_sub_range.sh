#! /bin/sh

SubNet="XX.XX.XX"
Cntr=1
while [ $Cntr -le 255 ]
do
        ping $SubNet.$Cntr 2 >/dev/null 2>/dev/null
        if [ $? -ne 0 ]
        then
                echo "No response from $SubNet.$Cntr"
                nslookup $SubNet.$Cntr <hostname> |grep name|awk -F= '{ print $NF }
'
        fi
        Cntr=`expr $Cntr + 1`
done
