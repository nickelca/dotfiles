#!/usr/bin/env bash

if [ -z "$@" ]; then
    echo -en "Restart\0icon\x1freplay\n"
    echo -en "Reload Config\0icon\x1fsync\n"
    # echo -en "Restart\0icon\x1fsystem-restart\n"
    # echo -en "Reload Config\0icon\x1fsystem-log-out\n"
else
    if [ "$1" = "Restart" ]; then
        i3-msg -q restart
    elif [ "$1" = "Reload Config" ]; then
        i3-msg -q reload
    fi
fi
