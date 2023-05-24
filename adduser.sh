#!/bin/sh

 

################################################################################

## This script adds a new user to the home directory and it also creates a passw

## can assign a password to any new user who is created.

################################################################################

 

echo "Enter Username"

read USER

echo "Enter Groupname"

read GROUP

echo "Enter Full Name"

read COM

 

/usr/sbin/useradd -g $GROUP -G 10 -d /home/$USER -c "$COM" -s "$SHELL" -m $USER

#wait 5

sleep 5

chown -R $USER:$GROUP $USER

passwd $USER

#passwd $USER | passwd -f $USER
