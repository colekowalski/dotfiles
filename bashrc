#!/bin/bash

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# color definitions
RED='\e[0;31m'
BLUE='\e[0;34m'
CYAN='\e[0;36m'
NORMAL='\e[0m'

## set the ps1 prompt
UIDCOLOR=$CYAN
PROMPTCHAR=" ~>"
if [[ $UID = 0 ]]; then
    UIDCOLOR=$RED
    PROMPTCHAR="#"
fi
PS1="[$UIDCOLOR\u@\h $BLUE\w$NORMAL]\$(__git_ps1)$PROMPTCHAR $NORMAL"

alias ls="ls --color"
alias ll="ls -Al"
