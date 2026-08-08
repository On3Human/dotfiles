#!/bin/sh
eth=$(ip -o link show | awk -F': ' '/^[0-9]+: (en|eth)/{print $2}' | head -n1)
if [ -n "$eth" ] && [ "$(cat /sys/class/net/"$eth"/operstate 2>/dev/null)" = "up" ]; then
    ip=$(ip -4 -o addr show "$eth" | awk '{print $4}' | cut -d/ -f1)
    echo "LAN: ${ip:-connected}"
    exit 0
fi

wlan=$(iw dev | awk '$1=="Interface"{print $2; exit}')
ssid=$(iw dev "$wlan" link 2>/dev/null | awk -F': ' '/SSID/{print $2}')
if [ -z "$ssid" ]; then
    echo "disconnected"
    echo "#fb4934"
else
    echo "$ssid"
fi
