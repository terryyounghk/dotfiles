alias -g cm='chezmoi'
alias -g cmc='chezmoi cd'
alias -g cme='chezmoi edit'
alias -g cma='chezmoi apply'
alias -g cmd='chezmoi-add-or-re-add'
alias -g cmi='chezmoi-fzf-add'
alias -g cmm='chezmoi managed | fzf'

chezmoi-add-or-re-add () {
  chezmoi add --follow $1 || chezmoi re-add $1
}

chezmoi-fzf-add () {
  chezmoi-add-or-re-add $(fdf -m "$1")
}

