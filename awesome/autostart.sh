#!/bin/sh

run() {
    if ! pgrep -f $1; then
        $@&
    fi
}

# Boring applications
run numlockx on
run start-pulseaudio-x11
run lightscreen

run firefox
run spotify
run steam

nitrogen --random --head=0 --set-zoom-fill ~/Images/Wallpapers/
nitrogen --random --head=1 --set-zoom-fill ~/Images/Wallpapers/
