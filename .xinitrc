#!/bin/sh

#export TERMINAL="urxvtc"
export TERMINAL="gnome-terminal"

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

if [ -e $HOME/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

if [ -e $HOME/.Xresources.local ]; then
    xrdb -merge ~/.Xresources.local
fi

if [ -e $HOME/.xmodmap ]; then
    xmodmap ~/.xmodmap
fi

# see: https://bugs.archlinux.org/task/46374
dbus-update-activation-environment --systemd --all

urxvtd -q -f -o

exec i3
