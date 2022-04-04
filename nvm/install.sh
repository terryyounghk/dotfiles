#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

echo ''
echo 'Installing nvm...'
echo ''
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#source nvm/nvm.symlink/nvm.sh

echo ''
echo 'Installing latest npm and nodejs lts...'
echo ''
nvm install --latest-npm --lts
nvm alias default stable

# follow the message's instructions in case npm needs upgrading

# yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# global packages
npm install -g \
  eslint \
  ts-node \
  typescript \
  yarn

exit 0
