#!/bin/bash
# Written by FalsePhilosopher & speedyes

apk update
apk add unzip coreutils-rm libpcap1
cd /tmp
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/files.zip
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/zips/RPi.zip
unzip -d / files.zip
unzip -d / RPi.zip
rm files.zip RPi.zip
pppwn list
echo ""
echo -e "\e[1;31mChange stage1/stage2.bin, firmware version and interface accordingly in '/etc/pppwnwrt/pppwnwrt.sh'! Start the script AFTER you change these variables! \e[0m"
echo ""
