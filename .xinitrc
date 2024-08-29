#!/usr/bin/env bash

export XDG_SESSION_TYPE=x11

picom &

exec i3
