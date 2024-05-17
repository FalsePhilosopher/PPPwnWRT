#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT11MIPS.zip
unzip PPPwnWRT11MIPS.zip
rm PPPwnWRT11MIPS.zip
/etc/init.d/PPPwnWRT enable
reboot
