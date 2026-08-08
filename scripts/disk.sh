#!/bin/sh
disk=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "DISK: ${disk}%"
[ "$disk" -ge 90 ] && echo "#fb4934"
