#!/bin/sh
CACHE=/tmp/.weather_cache
CACHE_AGE=1800

if [ -f "$CACHE" ] && [ $(($(date +%s) - $(stat -c %Y "$CACHE"))) -lt "$CACHE_AGE" ]; then
    cat "$CACHE"
    exit 0
fi

out=$(curl -s -m 5 "wttr.in/Cairo?format=%c+%t")
if [ -z "$out" ]; then
    [ -f "$CACHE" ] && cat "$CACHE" && exit 0
    echo "N/A"
    exit 0
fi

echo "$out" > "$CACHE"
echo "$out"
