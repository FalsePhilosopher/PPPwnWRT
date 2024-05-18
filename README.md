# OpenWRT PPPwn

OpenWRT install of PPPwn C++ version by xfangfang https://github.com/xfangfang/PPPwn_cpp

### Install 
1. SSH into your OpenWRT router  
2. Run for 9.00 RPI zero build  
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

Your interfaces are now displayed for you to replace `INTERFACE` in step 3 with your ethernet interface of choice.

3. Run pppwn

For 9.00  
```
pppwn --interface INTERFACE --fw 900 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry
```
For 11.00
```
pppwn --interface INTERFACE --fw 1100 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry
```
4. On your PS4:

- Go to `Settings` and then `Network`
- Select `Set Up Internet connection` and choose `Use a LAN Cable`
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`
- Enter anything for `PPPoE User ID` and `PPPoE Password`
- Choose `Automatic` for `DNS Settings` and `MTU Settings`
- Choose `Do Not Use` for `Proxy Server`
- Choose `Test Internet Connection`

So there isn't the overhead of this running all the time you need to do step's 3/4 every time you want to root your PS4, you don't need to do the internet connection set up again just test the internet connection.  

You can SSH in and run pppwn again or install the luci web interface for customs commands with
```
opkg install luci-app-commands
```
In the web interface you can add the pppwn command under System>Custom Commands and run it from there, you just won't be able to see the live output.


If you would like to make this a dedicated device you can If you can make it a daemon with an init script https://openwrt.org/docs/techref/initscripts  
or run it at startup by running for 9.00  
```
sed -i '3 i\pppwn --interface INTERFACE --fw 900 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry' /etc/rc.local
```
for 11.00
```
sed -i '3 i\pppwn --interface INTERFACE --fw 1100 --stage1 "/etc/PPPwnWRT/stage1.bin" --stage2 "/etc/PPPwnWRT/stage2.bin" --auto-retry' /etc/rc.local
```
