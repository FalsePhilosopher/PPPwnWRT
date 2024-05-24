#!/bin/sh
while true; do
    pppwn -i eth0.1 --fw 1100 -s1 stage/stage1.bin -s2 stage/stage2.bin -a
done
