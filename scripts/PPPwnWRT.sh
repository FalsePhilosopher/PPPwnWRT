#!/bin/sh /etc/rc.common

START=100
USE_PROCD=1

start_service() {
    while true; do
        pppwn -i eth0.1 --fw 1100 -s1 /etc/PPPwnWRT/stage1.bin -s2 /etc/PPPwnWRT/stage2.bin -a
    done
}
