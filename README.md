# OpenWRT PPPwn

OpenWRT install of PPPwn C++ version by xfangfang https://github.com/xfangfang/PPPwn_cpp

### Install 
1. SSH into your OpenWRT router  
2. Run for 9.00 RPI zero build
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9RPI.sh | sh 
```
9.00 MIPS build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9MIPS.sh | sh
```
9.00 Cortex A7 build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9CA7.sh | sh
```
11.00 RPI zero build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11RPI.sh | sh
```
11.00 MIPS build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11MIPS.sh | sh
```
11.00 Cortex A7 build  
```
wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11CA7.sh | sh
```  
For the record: It is not actually a good idea to make a habit of  
`curl $(random_script_from_the_internets) | bash"`  
Always read the source of what you run before you run it.

This script is setup for PPPwn to run at boot and is configured to run on ethernet port 1.
