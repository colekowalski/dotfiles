#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
TO_LINK=(bashrc bash_profile vimrc gitconfig gitignore_global)

if [ ! -d $DOTFILES_DIR ]; then
    git clone https://github.com/colekowalski/dotfiles $DOTFILES_DIR
fi

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

for item in ${TO_LINK[@]}; do
    link_target="${HOME}/.$item"
    if [ -L $link_target ]; then
        rm $link_target
    elif [ -f $link_target ] || [ -d $link_target ]; then
        echo "Cowardly refusing to remove non-symlink target: $link_target"
        exit 1
    fi
    ln -s ${DOTFILES_DIR}/${item} "${HOME}/.${item}"
done
