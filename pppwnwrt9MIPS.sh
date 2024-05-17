#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT9MIPS.zip
unzip PPPwnWRT9MIPS.zip
rm PPPwnWRT9MIPS.zip
/etc/init.d/PPPwnWRT enable
reboot
