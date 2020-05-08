autoload -U colors && colors
setopt prompt_subst

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' formats '%F{240} (%b)%f '
zstyle ':vcs_info:*' enable git

PROMPT_HOST=""
PROMPT_WARN=""

if remote_connection; then
  PROMPT_HOST="%{$fg[green]%}%n@%M%{$reset_color%} "
  PROMPT_WARN="[ %{$fg[red]%}PROD%{$reset_color%} ] "
fi

PROMPT='${PROMPT_WARN}[${PROMPT_HOST}%{$fg[blue]%}%~%{$reset_color%}]${vcs_info_msg_0_}%# '
