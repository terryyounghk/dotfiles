#!/bin/sh

# routine
[ ! -f script/helper ] && echo "Please run this from $HOME/.dotfiles" && exit 1
. script/helper

set -e

# Install the correct homebrew for each OS type
if test "$(uname)" = "Darwin"
then
  # Check for Homebrew
  if test ! $(which brew)
  then
    echo "  Installing Homebrew for you."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Upgrade homebrew
  echo "› brew update"
  brew update

  # Run Homebrew through the Brewfile
  cd homebrew
  echo "› brew bundle"
  brew bundle
  cd ..
fi
