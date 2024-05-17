#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT11CA7.zip
unzip PPPwnWRT11CA7.zip
rm PPPwnWRT11CA7.zip
/etc/init.d/PPPwnWRT enable
reboot
