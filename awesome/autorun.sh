#!/bin/sh


run() {
    if  ! pgrep -f $1; then
        $@&
    fi
}

# Boring applications
run nitrogen --restore
run xscreensaver
run nm-applet
run pulseaudio

run steam
