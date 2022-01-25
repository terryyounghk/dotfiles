#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

set -e

# Set zsh as the default shell
#chsh -s $(which zsh)

export ZIM_HOME=$DOTFILES/zim/zim.symlink

# Install zim
#curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

zsh $ZIM_HOME/zimfw.zsh install
