#!/bin/bash
chosen=$({ find ~/wallpapers/ -maxdepth 1 -type f; find ~/wallpapers/ -mindepth 2 -type f; } | rofi -dmenu -p "Wallpaper")
[ -n "$chosen" ] && feh --bg-scale "$chosen"
