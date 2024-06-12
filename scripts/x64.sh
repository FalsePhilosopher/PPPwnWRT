#!/bin/bash

opkg update
opkg install unzip coreutils-rm libpcap1
cd /tmp
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/files.zip
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/x86_64.zip
unzip -d / files.zip
unzip -d / x86_64.zip
rm files.zip x86_64.zip
pppwn list
echo ""
echo -e "\e[1;31mChange stage1.bin, firmware version and interface accordingly in '/etc/pppwnwrt/pppwnwrt.sh'! Start the script AFTER you change these variables! \e[0m"
echo ""
