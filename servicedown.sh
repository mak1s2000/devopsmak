#!/bin/bash

# Monitor if Apache service is alive

HTTPD_STATUS="/var/tmp/httpd_status"

/usr/bin/systemctl status httpd | /bin/grep "Active: failed" > ${HTTPD_STATUS}

if [ -s ${HTTPD_STATUS} ] ; then
   echo >> ${HTTPD_STATUS}
   /usr/bin/systemctl start httpd
   /usr/bin/systemctl status httpd >> ${HTTPD_STATUS}
   /bin/cat ${HTTPD_STATUS} | /bin/mailx -s "Apache on `uname -n` was restarted" dennisk@on24.com jfunke@on24.com seyamak.shahrzad@on24.com
fi
