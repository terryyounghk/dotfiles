#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

# https://www.serverless.com/framework/docs/getting-started/

curl -o- -L https://slss.io/install | bash
