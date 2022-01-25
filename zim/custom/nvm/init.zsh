# NVM - load NVM without causing issues with "npm config prefix"
# See: https://stackoverflow.com/a/58559982/277666
export NVM_DIR="$HOME/.dotfiles/nvm/nvm.symlink"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

