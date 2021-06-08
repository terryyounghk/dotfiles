#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://github.com/amix/vimrc

ln -snf $DOTFILES/vim/vimrc $HOME/.vim_runtime

sh $HOME/.vim_runtime/install_awesome_vimrc.sh
