autoload -U colors && colors
setopt prompt_subst

function __git_branch {
    if ! git rev-parse 2> /dev/null; then
      return
    fi

    local branch=$(git symbolic-ref HEAD 2> /dev/null)
    echo " (${branch#refs/heads/}) "
}

PROMPT_HOST=""
PROMPT_WARN=""

if remote_connection; then
  PROMPT_HOST="%{$fg[green]%}%n@%M%{$reset_color%} "
  PROMPT_WARN="[ %{$fg[red]%}PROD%{$reset_color%} ] "
fi

PROMPT='${PROMPT_WARN}[${PROMPT_HOST}%{$fg[blue]%}%~%{$reset_color%}]$(__git_branch)%# '
