#!/bin/sh

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

if [ -e $HOME/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

if [ -e $HOME/.Xresources.local ]; then
    xrdb -merge ~/.Xresources
fi

if [ -e $HOME/.xmodmap ]; then
    xmodmap ~/.xmodmap
fi

exec i3
