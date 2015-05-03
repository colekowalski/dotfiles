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

## add some readline keybindings to vi insert mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^K' kill-line
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward

## load in our customizations
if [ -d "$HOME/.zsh" ]; then
    for file in $HOME/.zsh/*.zsh; do
        source $file
    done
fi

## make sure local bin dir is on the path
if [ -d "$HOME/bin" ]; then
    export PATH=$HOME/bin:$PATH
fi
