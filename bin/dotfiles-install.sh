#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

PROFILE_ALL=$(ls -1 $DOTFILES_DIR)
PROFILE_OSX=$(ls -1 $DOTFILES_DIR | egrep -v '^(Xresources|xmodmap|xmonad)')
PROFILE_SERVER=(bashrc bash_profile zshrc zsh vimrc vim gitconfig gitignore_global)

TO_LINK=$PROFILE_ALL
while getopts ":aos" opt; do
    case $opt in
        a)
            TO_LINK=${PROFILE_ALL[@]}
            ;;
        o)
            TO_LINK=${PROFILE_OSX[@]}
            ;;
        s)
            TO_LINK=${PROFILE_SERVER[@]}
            ;;
        :)
            echo "Option -$OPTARG requires an argument" >&2
            exit 1
            ;;
        \?)
          echo "Command line Options"
          echo -e "    -a\tLink all config files"
          echo -e "    -o\tLink all files usable on osx"
          echo -e "    -s\tLink minamal set of config files for use on servers"
          exit 1
          ;;
    esac
done

if [ ! -d $DOTFILES_DIR ]; then
    git clone https://github.com/colekowalski/dotfiles $DOTFILES_DIR
fi

## update dotfiles repo and submodules
cd $DOTFILES_DIR
git pull --ff-only
git submodule init
git submodule update

for item in ${TO_LINK[@]}; do
    link_target="${HOME}/.$item"
    if [ -L $link_target ]; then
        rm $link_target
    elif [ -f $link_target ] || [ -d $link_target ]; then
        echo "Cowardly refusing to remove non-symlink target: $link_target"
        continue
    fi
    ln -s ${DOTFILES_DIR}/${item} "${HOME}/.${item}"
done
