#!/bin/bash
# Written by FalsePhilosopher
opkg update
opkg install unzip coreutils-rm libpcap1
cd /
wget https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/PPPwnWRT9CA7.zip
unzip PPPwnWRT9CA7.zip
rm PPPwnWRT9CA7.zip
