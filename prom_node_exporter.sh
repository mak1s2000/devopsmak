#!/bin/sh
#
# node_exporter        Startup script for the Node_exporter Server
#
# chkconfig: - 85 15
# description: The Node Exporter server implementing the current Prometheus standards.
#
#Node Exporter Configuration
Node_EXP=/opt/node_exporter/
#
if [ "$1" = "start" ] ; then
cd "$Node_EXP" && nohup ./node_exporter &
exit 0
fi

if [ "$1" = "stop" ] ; then
cd $NODE_EXP && nohup ./node_exporter &
fi
exit 0
