#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT11RPI.zip
unzip PPPwnWRT11RPI.zip
rm PPPwnWRT11RPI.zip
