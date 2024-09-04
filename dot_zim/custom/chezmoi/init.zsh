chezmoi-add-or-re-add () {
  chezmoi add --follow "$@" || chezmoi re-add "$@"
}

chezmoi-fzf-add () {
  chezmoi-add-or-re-add $(realpath $(fzf --multi | tr '\n' ' '))
}

chezmoi-fzf-apply () {
chezmoi apply $(realpath $(fzf --multi | tr '\n' ' '))
}

chezmoi-fzf-managed () {
  chezmoi managed $(realpath $(fzf --multi | tr '\n' ' '))
}

