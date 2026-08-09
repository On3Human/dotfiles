#!/bin/bash
failed=$(systemctl --failed)
regex="([0-9]+) loaded units listed.*"
if [[ "$failed" =~ $regex ]]
then
    failed_count="${BASH_REMATCH[1]}"
    if [[ "$failed_count" -gt 0 ]];
    then
        echo "$failed_count"
        echo "$failed_count"
        exit 33
    fi
else
    echo "Failed to match"
fi
