#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# Place before any other application
run "xrandr --output DP-1 --off" 

# Boring applications
run "picom" -b
run "nitrogen" --random
run "xscreensaver"
run "nm-applet"

# fun stuff
run "steam"
run "firefox"
run "moosync"

# Swap screens hack
run "xrandr --output DP-1 --auto --left-of HDMI-0"
