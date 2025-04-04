# OpenWRT PPPwn

**This repo is for people with a basic understanding of linux and networking, if terminals scare you then stop reading and use something else such as.**  
*OpenWRT specific*  
https://github.com/CodeInvers3/PPPwn_ow  
https://github.com/MODDEDWARFARE/PPPwn_WRT (This project is outdated, use the 24.XX branch of my [fork](https://github.com/FalsePhilosopher/PPPwn_WRT/tree/24.XX%2B) for support on OpenWRT 24.XX+ systems and 9.03 FW)  

*Other HW*  
https://github.com/DrYenyen/PPPwn-Tinker-GUI  
https://github.com/stooged/PI-Pwn
https://github.com/0x1iii1ii/PPPwn-Luckfox  
https://github.com/PokersKun/PPPwn-Loader  
https://github.com/B-Dem/PPPwnUI  
**If terminals don't scare you and you won't need "halp plz with intall" then continue reading**  

---

# OpenWRT install of [PPPwn_cpp by xfangfang](https://github.com/xfangfang/PPPwn_cpp)

Currently included is PPPwn C++ release: Nightly 20240616(June 30 2024) which includes the IPV6 fix for the "cursed consoles" and goldhen stage2 payload v1.04 for GH 2.4b18.3 support.

If installing for OpenWRT 23.05 or below follow the 23.05 install scripts below the 24.XX+ install scripts as 23.05 and below uses a different package manger.

### Install
1. Place the [goldhen.bin](https://ko-fi.com/sistro/shop) from a goldhen v2.4b18.2 and up release on the root of a usb drive formatted in exfat or fat32  
2. Plug the USB drive into your PS4
3. SSH into your OpenWRT router
4. Run for:

Raspberry Pi build:
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/RPi.sh | sh
```
MIPS build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/MIPS.sh | sh
```
MIPS(Big Endian) build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/MIPSEL.sh | sh
```
Cortex A7 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/CortexA7.sh | sh
```
ARM_64 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/ARM_64.sh | sh
```
x86_64 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/x86_64.sh | sh
```
# 23.05 and below ONLY!

Raspberry Pi build:
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/RPi.sh | sh
```
MIPS build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/MIPS.sh | sh
```
MIPS(Big Endian) build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/MIPSEL.sh | sh
```
Cortex A7 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/CortexA7.sh | sh
```
ARM_64 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/ARM_64.sh | sh
```
x86_64 build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/scripts/23/x86_64.sh | sh
```

For the record: It is not actually a good idea to make a habit of
`wget random_script_from_the_internets | sh`
Always read the source of what you run BEFORE you run it!

Your interfaces are now displayed for you to replace `INTERFACE` in step 5 with your ethernet interface of choice.

5. Edit `/etc/pppwnwrt/pppwnwrt.sh`

For 9.00
```
pppwn -i INTERFACE --fw 900 -s1 "/etc/pppwnwrt/stage1_900.bin" -s2 "/etc/pppwnwrt/stage2_9.00.bin" -a
```
For 11.00
```
pppwn -i INTERFACE --fw 1100 -s1 "/etc/pppwnwrt/stage1_1100.bin" -s2 "/etc/pppwnwrt/stage2_11.00.bin" -a
```
The included Stage 1 payloads are for 9.00 or 11.00, you can compile the S1 PL for a different FW following SiSTR0's PPPwn use [instructions](https://github.com/SiSTR0/PPPwn#usage)  
(If you're low on space, you can remove unneeded stage1.bin file for different FW)

Note: included stage2.bin is GoldHEN for FW 9.00 and 11.0.0. You can change it to whatever [stage2.bin](https://github.com/SiSTR0/PPPwn/releases) GoldHen payload you want to be able to support some FW 9.00 - 11.0.0  
For those on FW not supported by a GoldHEN release, EchoStretch has you covered [here](https://github.com/EchoStretch/ps4-hen-vtx/releases) with precompiled bins for every FW 7.00-11.00  
(If you're low on space, you can remove unneeded stage2.bin file for different FW)

6. Enable auto-start in OpenWRT
- `/etc/init.d/pppwnwrt enable`
- `/etc/init.d/pppwnwrt start`
- `top -d 1 | grep pppwn` to ensure pppwn is running

7. On your PS4:

- Go to `Settings` and then `Network`
- Select `Set Up Internet connection` and choose `Use a LAN Cable`
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`
- Enter anything for `PPPoE User ID` and `PPPoE Password`
- Choose `Automatic` for `DNS Settings` and `MTU Settings`
- Choose `Do Not Use` for `Proxy Server`
- Choose `Test Internet Connection`
- Wait until `PPPwned` message appears
- Head back to `Set Up Internet connection` and change to your normal internet settings or turn off internet connection

From now on, your PS4 will be jailbroken everytime it is powered on, as long as it's connected to the router. Unfortunately, the script does not have it's output, so the only ways to determine if it's injecting a payload is by looking for `Cannot set up internet connection` message, 'loading symbols' on the bottom of `What's new` app, or choppy audio. The custom version of stage2 first looks for the payload in the root directory of the USB drive, and if found, it is copied to the internal HDD at this path: /data/GoldHEN/payloads/goldhen.bin. The internal payload is then loaded and is no longer needed on the external USB drive. You can remove the usb drive from your ps4 after it has been run the first time and you won't need it again.

### Kill Script
Comes with a kill script in /root that used Modded Warfare's [kill script](https://github.com/MODDEDWARFARE/PPPwn_WRT/blob/main/kill.sh) as a template, but was modified to work with this setup.
The original script used [this resource](https://askubuntu.com/questions/180336/how-to-find-the-process-id-pid-of-a-running-terminal-program) as a template.

### WPS Button Exploit Trigger
1. Install kmod-button-hotplug
```
apk add kmod-button-hotplug`
```
for 23.05 and below systems 
```
opkg install kmod-button-hotplug`
```
2. Create a file called `wps` in /etc/hotplug.d/button/ with the contents below.
```
source /lib/functions.sh

do_button () {
    local button
    local action
    local handler
    local min
    local max

    config_get button "${1}" button
    config_get action "${1}" action
    config_get handler "${1}" handler
    config_get min "${1}" min
    config_get max "${1}" max

    [ "${ACTION}" = "${action}" -a "${BUTTON}" = "${button}" -a -n "${handler}" ] && {
        [ -z "${min}" -o -z "${max}" ] && eval ${handler}
        [ -n "${min}" -a -n "${max}" ] && {
            [ "${min}" -le "${SEEN}" -a "${max}" -ge "${SEEN}" ] && eval ${handler}
        }
    }
}

config_load system
config_foreach do_button button
EOF

uci add system button
uci set system.@button[-1].button="wps"
uci set system.@button[-1].action="released"
uci set system.@button[-1].handler="pppwn --interface INTERFACE --fw 900 --stage1 "/etc/pppwnwrt/stage1.bin" --stage2 "/etc/pppwnwrt/stage2.bin" --auto-retry"
uci set system.@button[-1].min="0"
uci set system.@button[-1].max="2"
uci add system button
uci set system.@button[-1].button="wps"
uci set system.@button[-1].action="released"
uci set system.@button[-1].handler="/etc/rc.button/wps"
uci set system.@button[-1].min="3"
uci set system.@button[-1].max="10"
uci commit system
```
Be sure to put the proper interface/FW in the `handler` line.

This will trigger pppwn to run when pressed for less then 2 seconds and when pressed for 3-10 seconds will trigger the stock wps functionality.
Triggering your LED to turn on and off during the payload is specific to your router which is why it was left out of this config.
If you set up auto-start, disable it by running `/etc/init.d/pppwnwrt disable` and `/etc/init.d/pppwnwrt stop`
Further resources with LED examples can be found here https://openwrt.org/docs/guide-user/hardware/hardware.button

### Manual Install
1. git clone sistro's pppwn (repo)[https://github.com/SiSTR0/PPPwn] and build pppwn S1 and S2 PL's for your FW
2. Put the S1 and S2 PL's in a dir name `pppwnwrt` and scp or sftp the dir to /etc
3. git clone and build (pppwn_cpp)[https://github.com/xfangfang/PPPwn_cpp] or pull from their nightly build (server)[https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main?status=completed]
4. scp or sftp the executable to /bin
5. Install libpcap1
6. Run pppwn

### DD-WRT Install
DD-WRT uses a different package manager and pcap package, so the OpenWRT install script above will not work for DD-WRT.
1. Follow the manual install method to step 4
2. Install libpcap `ipkg install libpcap`
3. Run pppwn
