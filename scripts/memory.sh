#!/bin/sh
mem=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
echo "MEM: ${mem}%"
[ "$mem" -ge 85 ] && echo "#fb4934"
