#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://rime.im/
# https://github.com/rime/plum

rime/plum/rime-install prelude essay cantonese quick scj emoji
