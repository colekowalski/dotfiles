autoload -U colors && colors
setopt prompt_subst

function __git_branch {
    if ! git rev-parse 2> /dev/null; then
      return
    fi

    local branch=$(git symbolic-ref HEAD 2> /dev/null)
    echo " (${branch#refs/heads/}) "
}

#PROMPT_STATUS=%(?..%{$fg[red]%}ಠ_ಠ )%{$reset_color%}
PROMPT='${PROMPT_STATUS}[%{$fg[blue]%}%~%{$reset_color%}]$(__git_branch)%# '
