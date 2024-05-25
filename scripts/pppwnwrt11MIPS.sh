#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /tmp
wget https://github.com/speedyes/PPPwnWRT/raw/main/zips/files.zip
wget https://github.com/speedyes/PPPwnWRT/raw/main/zips/MIPS.zip
unzip -d / files.zip MIPS.zip
rm files.zip MIPS.zip
pppwn list
echo ""
echo "Change stage1.bin, firmware version and interface accordingly in '/etc/pppwnwrt/pppwnwrt.sh'! Start the script AFTER you change these variables!"
