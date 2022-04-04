#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

ln -snf $DOTFILES/gnupg/gpg.conf $HOME/.gnupg/gpg.conf

ln -snf $DOTFILES/gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf

# make directory unreadable by others
chmod -R o-rx .

# make symlink available only to current user
chmod 700 "$HOME/.gnupg"

# If you are on MacOS and installed brew install gnupg, you can create a symlink to point gpg2 to gpg
# Change the paths accordingly in case your gpg was installed differently
sudo ln -snf $(brew --prefix)/bin/gpg $(brew --prefix)/bin/gpg2
