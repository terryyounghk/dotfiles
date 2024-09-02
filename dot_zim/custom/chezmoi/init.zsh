chezmoi-add-or-re-add () {
  chezmoi add --follow "$@" || chezmoi re-add "$@"
}

chezmoi-fzf-add () {
  chezmoi-add-or-re-add $(fzf --multi | tr '\n' ' ')
}

