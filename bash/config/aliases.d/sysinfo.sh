# Sys info
alias cpu='cat /proc/cpuinfo'
alias mem='cat /proc/meminfo'
alias topmem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

alias psgrep="ps aux | egrep -v egrep | egrep"
