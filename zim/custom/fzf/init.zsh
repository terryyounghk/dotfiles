# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install

# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--extended --no-height"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=numbers,header,grid --line-range :300 {}'"
export FZF_ALT_C_COMMAND="fd --type directory"
