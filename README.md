# OpenWRT PPPwn

OpenWRT install of PPPwn C++ version by xfangfang https://github.com/xfangfang/PPPwn_cpp

### Install 
1. Place the goldhen.bin from a goldhen 2.4b17 and up release on the root of a usb drive formatted in exfat or fat32  
https://github.com/GoldHEN/GoldHEN/releases/download/2.4b17/GoldHEN_v2.4b17.7z
2. Plug the USB drive into your PS4
3. SSH into your OpenWRT router  
4. Run for 9.00 RPI zero build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9RPI.sh | sh && pppwn list
```
9.00 MIPS build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9MIPS.sh | sh && pppwn list
```
9.00 Cortex A7 build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9CA7.sh | sh && pppwn list
```
11.00 RPI zero build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11RPI.sh | sh && pppwn list
```
11.00 MIPS build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11MIPS.sh | sh && pppwn list
```
11.00 Cortex A7 build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11CA7.sh | sh && pppwn list
```  
For the record: It is not actually a good idea to make a habit of  
`curl $(random_script_from_the_internets) | bash"`  
Always read the source of what you run before you run it.

Your interfaces are now displayed for you to replace `INTERFACE` in step 5 with your ethernet interface of choice.

5. Run pppwn

For 9.00  
```
pppwn --interface INTERFACE --fw 900 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry
```
For 11.00
```
pppwn --interface INTERFACE --fw 1100 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry
```
6. On your PS4:

- Go to `Settings` and then `Network`
- Select `Set Up Internet connection` and choose `Use a LAN Cable`
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`
- Enter anything for `PPPoE User ID` and `PPPoE Password`
- Choose `Automatic` for `DNS Settings` and `MTU Settings`
- Choose `Do Not Use` for `Proxy Server`
- Choose `Test Internet Connection`



So there isn't the overhead of this running all the time you need to do step's 5/6 every time you want to root your PS4, you don't need to do the internet connection set up again just test the internet connection. The custom version of stage2 first looks for the payload in the root directory of the USB drive, and if found, it is copied to the internal HDD at this path: /data/GoldHEN/payloads/goldhen.bin. The internal payload is then loaded and is no longer needed on the external USB drive. You can remove the usb drive from your ps4 after it has been run the first time and you won't need it again.  

To root your console again you can SSH in and run pppwn again or install the luci web interface for customs commands with
```
opkg install luci-app-commands
```
In the web interface you can add the pppwn command under System>Custom Commands and run it from there, you just won't be able to see the live output.

### WPS Button Exploit Trigger  
1. Install kmod-button-hotplug  
`opkg install kmod-button-hotplug`  
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
uci set system.@button[-1].handler="pppwn --interface INTERFACE --fw 900 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry"
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
Triggering your LED to turn on and off during the PL is specific to your router which is why it was left out of this config.  
Further resources with LED examples can be found here https://openwrt.org/docs/guide-user/hardware/hardware.button

If you would like to make this a dedicated device you can If you can make it a daemon with an init script https://openwrt.org/docs/techref/initscripts  
or run it at startup by running for 9.00  
```
sed -i '3 i\pppwn --interface INTERFACE --fw 900 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry' /etc/rc.local
```
for 11.00
```
sed -i '3 i\pppwn --interface INTERFACE --fw 1100 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry' /etc/rc.local
```

### Manual Install
1. git clone sistro's pppwn repo and build pppwn S1 and S2 PL's for your FW
https://github.com/SiSTR0/PPPwn
2. Put the S1 and S2 PL's in a dir and scp or sftp the dir to /etc
3. git clone and build pppwn_cpp or pull from their nightly build server  
Repo: https://github.com/xfangfang/PPPwn_cpp  
Nightly build server: https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main?status=completed  
5. scp or sftp the executable to /bin
6. Install libpcap1
7. Run pppwn

### DD-WRT Install
DD-WRT uses a different package manager and pcap package, so the OpenWRT install script above will not work for DD-WRT.  
1. Follow the manual install method to step 4
2. Install libpcap `ipkg install libpcap`
3. Run pppwn
