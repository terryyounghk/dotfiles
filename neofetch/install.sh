#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://github.com/dylanaraps/neofetch

confdir=$HOME/.config/neofetch/

mkdir -p $confdir

cp -f ./neofetch/config.conf $confdir
