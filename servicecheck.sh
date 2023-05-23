#!/bin/bash
DATE=`date +%Y%m%d`
CMD=`systemctl | grep -i failed | wc -l`
if [ ${CMD} -eq "0" ] ; then
echo "No errors in services"
else
systemctl | grep -i failed >> /tmp/failed.$DATE.txt
sleep 10;

mail -a /tmp/failed.$DATE.txt -s "Service failures" mak1s2000@hotmail.com < /dev/null
rm -rf /tmp/failed.$DATE.txt

fi
# devopsmak
