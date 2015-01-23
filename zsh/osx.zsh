## stop processing if we are not running on osx
if [[ ! "$OSTYPE" == "darwin"* ]]; then
    return
fi

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

alias ls="ls -G"
alias grep="grep --color=auto"
