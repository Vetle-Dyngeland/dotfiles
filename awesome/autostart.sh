#!/bin/sh

run() {
    if ! pgrep -f $1; then
        $@&
    fi
}

# Boring applications
run xscreensaver --no-splash
run numlockx on
run nm-applet --indicator
run start-pulseaudio-x11
run lightscreen

run steam
run firefox
run discord
run spotify
nitrogen --random --head=0 --set-zoom-fill ~/Images/Wallpapers/
nitrogen --random --head=1 --set-zoom-fill ~/Images/Wallpapers/
