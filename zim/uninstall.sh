#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

set -e

SUFFIX=$(date +%F-%H-%M)

rm -rf ~/.zim
mv ~/.zimrc ~/.zimrc.$SUFFIX
mv ~/.zshenv ~/.zshenv.$SUFFIX
mv ~/.zshrc ~/.zshrc.$SUFFIX
mv ~/.zlogin ~/.zlogin.$SUFFIX

rm ~/.zshenv.zwc
rm ~/.zshrc.zwc
rm ~/.zlogin.zwc
