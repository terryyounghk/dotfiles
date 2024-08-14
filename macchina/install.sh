#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://github.com/Macchina-CLI/macchina/wiki/Configuration

confdir=$HOME/.config/macchina/

mkdir -p $confdir

cp -f ./macchina/macchina.toml $confdir
cp -R ./macchina/themes $confdir
