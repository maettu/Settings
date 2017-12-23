#!/bin/bash

# helper script to dim screen fine grainedly.
# E.g. in xfce, add shortcut in Settings->keyboard->Application settings
# Settings/backlight/dim.sh + 10
# Settings/backlight/dim.sh - 10
# and assign keys like Ctrl-F12 and Ctrl-F11, where the brightness
# controlls are (Fn-F12 and Fn-F11)

brightness=`pkexec xfpm-power-backlight-helper --get-brightness`

if [ "$1" == "+" ]; then
    brightness=$((brightness+$2))
else
    brightness=$((brightness-$2))
fi

if [ "$brightness" -lt "1" ]; then
    brightness=1
fi

if [ "$brightness" -gt "1500" ]; then
    brightness=1500
fi

`pkexec xfpm-power-backlight-helper --set-brightness $brightness`
