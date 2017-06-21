#!/bin/sh

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

xrdb -merge ~/.Xresources

xmodmap ~/.xmodmap

exec i3
