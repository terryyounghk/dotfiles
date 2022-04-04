#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://rime.im/

# Rime should already be installed: brew install --cask squirrel
# See: https://formulae.brew.sh/cask/squirrel

# now use plum to install various input methods

# https://github.com/rime/plum
curl -fsSL https://git.io/rime-install | bash

# install additional input methods

plum/rime-install jyutping rime-cantonese

# clean up

rm -rf ./plum

# copy custom configurations

cp ./default.custom.yaml ~/Library/Rime/

# first time usage: activate the input method and choose "deploy" from the menu
