#!/bin/sh

run() {
    if ! pgrep -f $1; then
        $@&
    fi
}

# Boring applications
nitrogen --set-zoom-fill --head=0 ~/Images/Wallpapers/Purple\ river.png &
nitrogen --set-zoom-fill --head=1 ~/Images/Wallpapers/Purple\ river.png &
run xscreensaver --no-splash
run numlockx on
run nm-applet --indicator
run start-pulseaudio-x11
run lightscreen

run steam
run firefox
run discord
run spotify
