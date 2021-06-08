#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

set -e

sudo easy_install pip

curl -O https://bootstrap.pypa.io/get-pip.py

python3 get-pip.py --user

pip3 install pipenv
