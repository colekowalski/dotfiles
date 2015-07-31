autoload -U colors && colors
setopt prompt_subst

function __git_branch {
    if ! git rev-parse 2> /dev/null; then
      return
    fi

    local branch=$(git symbolic-ref HEAD 2> /dev/null)
    echo " (${branch#refs/heads/}) "
}


USER_COLOR="%{$fg[cyan]%}"
if [[ $UID = 0 ]]; then
    USER_COLOR="%{$fg[red]%}"
fi

PROMPT_STATUS=%(?.%{$fg[green]%}ツ.%{$fg[red]%}ಠ_ಠ)%{$reset_color%}
PROMPT='$PROMPT_STATUS [${USER_COLOR}%n@%m %{$fg[blue]%}%~%{$reset_color%}]$(__git_branch)%# '

MODE_INDICATOR="%{$fg[yellow]%}[n]%{$reset_color%} "

