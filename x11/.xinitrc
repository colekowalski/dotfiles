#!/bin/sh

#export TERMINAL="urxvtc"
export TERMINAL="alacritty"

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

# Source any local confiurations
# This is useful for system-specific settings such as the display configuration
# for a particular machine's monitors
if [ -e $HOME/.xinitrc.local ]; then
  source $HOME/.xinitrc.local
fi

# see: https://bugs.archlinux.org/task/46374
dbus-update-activation-environment --systemd --all

# gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Fix some QT applications on hidpi displays
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# urxvtd -q -f -o

exec i3
