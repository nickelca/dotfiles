#!/usr/bin/env bash

if [ -z "$@" ]; then
    echo -en "Shutdown\0icon\x1fsystem-shutdown\n"
    echo -en "Logout\0icon\x1fsystem-log-out\n"
    echo -en "Lock\0icon\x1fsystem-lock-screen\n"
    echo -en "Suspend\0icon\x1fsystem-suspend\n"
    echo -en "Reboot\0icon\x1fsystem-reboot\n"
else
    if [ "$1" = "Shutdown" ]; then
        systemctl poweroff
    elif [ "$1" = "Logout" ]; then
        i3-msg -q exit
    elif [ "$1" = "Lock" ]; then
        loginctl lock-session
    elif [ "$1" = "Suspend" ]; then
        systemctl suspend
    elif [ "$1" = "Reboot" ]; then
        systemctl reboot
    fi
fi
