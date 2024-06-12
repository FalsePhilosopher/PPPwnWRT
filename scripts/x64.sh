#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /tmp
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/files.zip
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/x64.zip
unzip -d / files.zip
unzip -d / x64.zip
rm files.zip x64.zip
pppwn list
echo ""
echo -e "${RED}Change stage1.bin, firmware version and interface accordingly in '/etc/pppwnwrt/pppwnwrt.sh'! Start the script AFTER you change these variables!${NC}"
