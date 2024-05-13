# OpenWRT PPPwn

OpenWRT install of PPPwn C++ version by xfangfang https://github.com/xfangfang/PPPwn_cpp

Install by SSHing into your OpenWRT router and run for 9.00 `wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt9.sh | sh`  
for 11.00 `wget -q -O - https://github.com/FalsePhilosopher/PPPwnWRT/raw/main/pppwnwrt11.sh | sh`
For the record: It is not actually a good idea to make a habit of  
`curl $(random_script_from_the_internets) | bash"`  
Please always read the source of what you run before you run it.

This script is configured for PPPwn to run at boot and is setup for ethernet port 1.
