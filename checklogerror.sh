#!/bin/sh

###############################################################################################

## This script collects the log files and any errors associated with the system and places the

## results under a file called review, it would also make a copy of the password file and shadow

## file and if available, it will send an email to the administrator where sendmail is enabled.

###############################################################################################

 

clear

 

echo "Remove old entry from file 'review' (y/n)\c"

 

read REMOVE

 

HOSTNAME=`hostname`

 

cd /home/ss1500/tmp

 

rm -i review

 

hostname >> /home/ss1500/tmp/review

 

echo "==============================================================="

>> /home/ss1500/tmp/review

 

cd /var/log

 

egrep -i "error|warning|panic|corrupt|kernel" /var/log/messages | head -2 >> /home/ss1500/tmp/review

 

echo "================================================================="

>> /home/ss1500/tmp/review

 

who -b >> /home/ss1500/tmp/review

uptime >> /home/ss1500/tmp/review

echo "==============================================================="

>> /home/ss1500/tmp/review

 

 

echo "==============================================================="

 

vgdisplay >> /home/ss1500/tmp/review

 

echo "=============================================================="

 

cd /etc

 

cp -p passwd "passwd.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/passwd. `date +%m%d%y` >> /home/ss1500/tmp/review

mv passwd.`date +%m%d%y` /home/ss1500/tmp/

 

echo "============================================================="

cd /etc

cp -p fstab "fstab.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/fstab. `date +%m%d%y` >> /home/ss1500/tmp/review

mv fstab.`date +%m%d%y` /home/ss1500/tmp/

 

echo "============================================================"

cd /etc

cp -p shadow "shadow.`date +%m%d%y`" >> /home/ss1500/tmp/review

cksum /etc/shadow. `date +%m%d%y` >> /home/ss1500/tmp/review

mv shadow.`date +%m%d%y` /home/ss1500/tmp/

 

 

echo ""

clear
