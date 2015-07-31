## vi mode
bindkey -v

## enable editing cmdline with $EDITOR
autoload -Uz edit-command-line
bindkey -M vicmd v edit-command-line
zle -N edit-command-line

function zle-line-init {
  zle reset-prompt
}

## add indicator for mode when in command mode
function zle-line-init zle-keymap-select {
  RPROMPT="${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

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
