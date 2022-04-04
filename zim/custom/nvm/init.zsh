# Caution if your nvm dir or home dir is symbolic link
# NVM - load NVM without causing issues with "npm config prefix"
# See: https://stackoverflow.com/a/58559982/277666
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm-install () {
  # yarn
  curl -o- -L https://yarnpkg.com/install.sh | bash

  # global packages
  npm install -g \
    eslint \
    ts-node \
    typescript \
    yarn
}
