#!/bin/sh 

clear

#echo "Remove an old entry from file 'review' (y/n)\c"

HOSTNAME=`hostname`

cd /home/ss1500/tmp

rm -f review

hostname >> /home/ss1500/tmp/review

echo "==============================================================="

>> /home/ss1500/tmp/review

cd /var/log

egrep -i "error|warning|panic|corrupt|kernel" /var/log/messages | head -2 >> /home/ss1500/tmp/review

echo "================================================================="

>> /home/ss1500/tmp/review 

who -b >> /home/ss1500/tmp/review

uptime >> /home/ss1500/tmp/review

df -h >> /home/ss1500/tmp/review

echo "==============================================================="

>> /home/ss1500/tmp/review
 

echo "==============================================================="

#metastat >> /home/ss1500/tmp/review

cat /home/ss1500/tmp/review | mail -w XXXX@gmail.com

zoneadm list -icv >> /home/ss1500/tmp/review

echo "=============================================================="

cd /etc

cp -p passwd "passwd.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/passwd. `date +%m%d%y` >> /home/ss1500/tmp/review

mv passwd.`date +%m%d%y` /home/ss1500/tmp/

echo "============================================================="

cd /etc

cp -p vfstab "vfstab.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/vfstab. `date +%m%d%y` >> /home/ss1500/tmp/review

mv vfstab.`date +%m%d%y` /home/ss1500/tmp/

echo "============================================================"

cd /etc

cp -p shadow "shadow.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/shadow. `date +%m%d%y` >> /home/ss1500/tmp/review

mv shadow.`date +%m%d%y` /home/ss1500/tmp/

echo ""

clear
