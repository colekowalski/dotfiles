PROMPT="[%n@%m %~]%# "

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

autoload -Uz compinit
autoload edit-command-line
compinit

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first

## vi mode
bindkey -v

## enable editing cmdline with $EDITOR
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## make sure local bin dir is on the path
if [ -d "$HOME/bin" ]; then
    export PATH=$HOME/bin:$PATH
fi

## load in our customizations
if [ -d "$HOME/.zsh" ]; then
    for file in $HOME/.zsh/*.zsh; do
        source $file
    done
fi