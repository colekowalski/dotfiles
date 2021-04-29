## make sure local bin dir is on the path
[ -d $HOME/.bin ] && export PATH=$HOME/.bin:$PATH

# Load base16 shell configuration
if ! remote_connection; then
  BASE16_SHELL="$HOME/.zsh/vendor/base16-shell/scripts/base16-tomorrow-night.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
fi

## make (backward|forward)-word behave like bash
autoload -U select-word-style
select-word-style bash

# Edit command line in the default text editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

## emacs mode
bindkey -e
