#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# I use git commands here instead of symlinking to a git config file
# because these settings below are agnostic to personal/work environments

git config --global pager.status true
git config --global core.pager bat
