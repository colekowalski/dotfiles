## make sure local bin dir is on the path
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

export EDITOR='vim'
export GIT_EDITOR='vim'

# Enable more syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

if [[ ! "$OSTYPE" = darwin* ]]; then
  eval $(dircolors $DOTFILES/zsh/vendor/dircolors-solarized/dircolors.ansi-dark)
fi
