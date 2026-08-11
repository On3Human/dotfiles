#!/usr/bin/env bash

check_internet() {
    local hosts=("1.1.1.1" "8.8.8.8")
    for host in "${hosts[@]}"; do
        if ping -c 1 -W 2 "$host" &>/dev/null; then
            return 0
        fi
    done
    return 1
}

if check_internet; then
    echo "󰖩"
    echo "󰖩"
    echo "#b8bb26"
else
    echo "󰖪"
    echo "󰖪"
    echo "#fb4934"
fi
