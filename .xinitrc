#!/usr/bin/env bash

export XDG_SESSION_TYPE=x11

picom &
polybar &

exec i3
