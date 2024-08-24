# https://github.com/jesseduffield/lazygit/issues/1669
# lazygit config.yml is in ~/Library/Application Support/lazygit/config.yml
# instead of ~/.config/lazygit/config.yml
# This is a workaround
export XDG_CONFIG_HOME="$HOME/.config"

