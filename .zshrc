HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

export DOTFILES=$HOME/.dotfiles

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_expire_dups_first

## load in our customizations
if [ -d "$HOME/.zsh" ]; then
    for file in $HOME/.zsh/*.zsh; do
        source $file
    done
fi

## load completion after other plugins are loaded
autoload -Uz compinit
compinit -i

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
