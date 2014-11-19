## stop processing if we are not running on osx
if [[ ! "$OSTYPE" == "darwin"* ]]; then
    return
fi

export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

alias ls="ls -G"
alias grep="grep --color=auto"
