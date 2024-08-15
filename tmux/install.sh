#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

dir="$(pwd)"

cd "$(dirname $0)"

ln -snf $DOTFILES/tmux/.tmux.conf ~/.tmux.conf

cd $dir
