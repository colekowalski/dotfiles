HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

setopt hist_fcntl_lock

setopt extended_history
setopt share_history

setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first

# remove superfluous blanks from logged commands
setopt hist_reduce_blanks

# don't log commands starting with a space
setopt hist_ignore_space

setopt hist_lex_words


