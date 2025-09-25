## make sure local bin dir is on the path
[ -d $HOME/.bin ] && export PATH=$HOME/.bin:$PATH
[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH

## make (backward|forward)-word behave like bash
autoload -U select-word-style
select-word-style bash

# Edit command line in the default text editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

## emacs mode
bindkey -e
