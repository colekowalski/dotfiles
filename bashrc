#!/bin/bash

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# color definitions
RED=$(tput setaf 1)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)

## set the ps1 prompt
UIDCOLOR=$CYAN
PROMPTCHAR="~>"
if [[ $UID = 0 ]]; then
    UIDCOLOR=$RED
    PROMPTCHAR="#"
fi
PS1="[$UIDCOLOR\u@\h $BLUE\w$NORMAL]\$(__git_ps1) $PROMPTCHAR "

alias ls="ls --color"
alias ll="ls -Al"
