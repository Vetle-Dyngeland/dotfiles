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
run start-pulseaudio-x11
run pulseaudio
run lightscreen

run steam
