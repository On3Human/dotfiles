#!/bin/sh
read _ u n s idle rest < /proc/stat
p_idle=$(cat /tmp/.cpu_i 2>/dev/null || echo 0)
p_total=$(cat /tmp/.cpu_t 2>/dev/null || echo 0)
total=$((u+n+s+idle))
d_idle=$((idle-p_idle))
d_total=$((total-p_total))
usage=$(( (1000*(d_total-d_idle)/d_total+5)/10 ))
echo $total > /tmp/.cpu_t
echo $idle > /tmp/.cpu_i
echo "CPU: ${usage}%"
[ "$usage" -ge 80 ] && echo "#fb4934"
