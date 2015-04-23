function __git_branch {
    if ! git rev-parse 2> /dev/null; then
      return
    fi

    local branch=$(git symbolic-ref HEAD 2> /dev/null)
    echo " (${branch#refs/heads/}) "
}

autoload -U colors && colors

setopt prompt_subst

USER_COLOR="%F{cyan}"
if [[ $UID = 0 ]]; then
    USER_COLOR="%F{red}"
fi

PROMPT='[${USER_COLOR}%n@%m %F{blue}%~$reset_color]$(__git_branch)%# '
