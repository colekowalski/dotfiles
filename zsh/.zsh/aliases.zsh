case $OSTYPE in
    darwin*)
        alias ls="ls -G"
        alias ll="ls -Alh"
    ;;

    linux-gnu)
        alias ls="ls --color"
        alias ll="ls -Alh --group-directories-first"
        ;;
esac

alias lc="tr 'A-Z' 'a-z'"
alias uc="tr 'a-z' 'A-Z'"
