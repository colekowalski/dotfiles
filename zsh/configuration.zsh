## make sure local bin dir is on the path
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

# Enable more syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Load base16 shell configuration
BASE16_SHELL="$DOTFILES/zsh/vendor/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
