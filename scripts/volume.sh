#!/bin/sh
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
if [ "$mute" = "yes" ]; then
    echo "MUTE"
    echo "#928374"
else
    echo "VOL: ${vol}"
fi
