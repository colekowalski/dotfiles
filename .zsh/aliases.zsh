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
