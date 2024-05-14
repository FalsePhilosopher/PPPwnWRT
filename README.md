# OpenWRT PPPwn

OpenWRT install of PPPwn C++ version by xfangfang https://github.com/xfangfang/PPPwn_cpp

### Install 
1. SSH into your OpenWRT router  
2. For 9.00 run `wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9.sh | sh`  
for 11.00 `wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11.sh | sh`

For the record: It is not actually a good idea to make a habit of  
`curl $(random_script_from_the_internets) | bash"`  
Always read the source of what you run before you run it.

This script is setup for PPPwn to run at boot and is configured to run on ethernet port 1.  
This was tested on OpenWRT 23.05, if you have issues update your OpenWRT to the most recent version.
