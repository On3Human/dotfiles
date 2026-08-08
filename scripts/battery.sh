#!/bin/sh
bat=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)
[ -z "$bat" ] && exit 0
echo "BAT: ${bat}% (${status})"
[ "$bat" -le 15 ] && [ "$status" != "Charging" ] && echo "#fb4934"
