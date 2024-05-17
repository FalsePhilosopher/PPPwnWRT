#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT9RPI.zip
unzip PPPwnWRT9RPI.zip
rm PPPwnWRT9RPI.zip
/etc/init.d/PPPwnWRT enable
reboot
