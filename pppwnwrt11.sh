#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT11.zip
unzip PPPwnWRT11.zip
rm PPPwnWRT11.zip
sed -i '3 i\pppwn --interface lan1 --fw 1100 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry' /etc/rc.local
reboot
