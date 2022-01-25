#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

echo ''
echo 'Installing NodeJS with NVM (Uninstall NodeJS installed from pkg first)...'
echo ''
sudo ./nvm/uninstall-node.sh

echo ''
echo 'Installing NodeJS with NVM...'
echo ''
source nvm/nvm.symlink/nvm.sh

nvm install --latest-npm --lts
nvm alias default stable

exit 0
