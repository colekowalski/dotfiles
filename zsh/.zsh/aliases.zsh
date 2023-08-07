case $OSTYPE in
    darwin*)
        alias ls="ls -G"
        alias ll="ls -Alh"
    ;;

    linux-gnu)
        alias ls="ls -N --group-directories-first --color"
        alias ll="ls -N -Alh --group-directories-first"
        ;;
esac

alias lc="tr 'A-Z' 'a-z'"
alias uc="tr 'a-z' 'A-Z'"
