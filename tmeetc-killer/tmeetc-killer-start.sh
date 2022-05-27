#!/bin/bash

while true; do
    miner_RE='tracker-miner-f'
    extract_RE='tracker-extract'

    allProcesses=$(ps -e)

    miner_match=$(echo "$allProcesses" | grep $miner_RE)
    [[ "$miner_match" =~ [0-9]+ ]] && miner_match=${BASH_REMATCH[0]}
    if [[ -n "$miner_match" ]]; then
        $(kill -s 15 $miner_match)
    fi

    extract_match=$(echo "$allProcesses" | grep $extract_RE)
    [[ "$extract_match" =~ [0-9]+ ]] && extract_match=${BASH_REMATCH[0]}
    if [[ -n "$extract_match" ]]; then
        $(kill -s 15 $extract_match)
    fi

    $(rm -rf /home/*/.cache/tracker3)

    sleep 5

    unset miner_RE
    unset extract_RE
    unset allProcesses
    unset miner_match
    unset extract_match

done
