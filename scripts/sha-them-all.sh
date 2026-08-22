#!/bin/bash

for f in * 
do
    if [[ -d $f ]]; then
        continue
    fi
    shasum --algorithm=512 "$f"
done
