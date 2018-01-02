## load functions first as they may be required later
if [ -d $HOME/.zsh/functions ]; then
  for file in $HOME/.zsh/functions/*; do
    source $file
  done
fi

## load in our customizations
if [ -d "$HOME/.zsh" ]; then
    for file in $HOME/.zsh/*.zsh; do
        source $file
    done
fi

## load completion after other plugins are loaded
autoload -Uz compinit
compinit -i

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
