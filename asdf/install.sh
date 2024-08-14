#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin add vars https://github.com/excid3/asdf-vars

# https://github.com/asdf-community/asdf-direnv
asdf plugin-add direnv
asdf direnv setup --shell zsh --version latest
