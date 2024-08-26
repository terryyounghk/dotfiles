chezmoi-add-or-re-add () {
  chezmoi add --follow $1 || chezmoi re-add $1
}

chezmoi-fzf-add () {
  chezmoi-add-or-re-add $(fdf -m "$1")
}

