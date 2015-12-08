## vi mode
bindkey -v

## enable editing cmdline with $EDITOR
autoload -Uz edit-command-line
bindkey -M vicmd v edit-command-line
zle -N edit-command-line

# show warning if running as root
local user_indicator=""
if [[ $UID = 0 ]]; then
  user_indicator="%{$fg[red]%}**ROOT**%{$reset_color%} "
fi

local vi_cmd_mode="%{$fg[yellow]%}[n]%{$reset_color%}"
local vi_mode=""

function zle-line-init {
  zle reset-prompt
}

function zle-keymap-select {
  vi_mode="${${KEYMAP/vicmd/${vi_cmd_mode}}/(main|viins)}"
  zle reset-prompt
}

function zle-line-finish {
  vi_mode=""
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

# fix a bug when you C-c in CMD mode, the status indicator will
# show the incorrect mode
function TRAPINT() {
  vi_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

# only display RPROMPT on the current line
setopt transient_rprompt

RPROMPT='${user_indicator}${vi_mode}'

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

bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward
