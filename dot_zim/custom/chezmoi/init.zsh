# chezmoi

alias cm='chezmoi'
alias cmc='chezmoi cd'
alias cme='chezmoi edit'
alias cma='chezmoi apply'
alias cmf='chezmoi forget'
alias cmg='chezmoi edit-config-template'
alias cmi='chezmoi init'
alias cmai='chezmoi-fzf-apply'
alias cmadd='chezmoi-add-or-re-add'
alias cmaf='chezmoi-fzf-add'
alias cmff='chezmoi-fzf-forget'
alias cmm='chezmoi managed'
alias cmmi='chezmoi-fzf-managed'

# -----------------------------------------------------------------------------------

chezmoi-add-or-re-add () {
  chezmoi add --follow "$@" || chezmoi re-add "$@"
}

chezmoi-fzf-add () {
  chezmoi-add-or-re-add $(realpath $(fzf --multi | tr '\n' ' '))
}

chezmoi-fzf-apply () {
  chezmoi apply $(realpath $(fzf --multi | tr '\n' ' '))
}

chezmoi-fzf-forget () {
  chezmoi forget $(realpath $(fzf --multi | tr '\n' ' '))
}

chezmoi-fzf-managed () {
  chezmoi managed $(realpath $(fzf --multi | tr '\n' ' '))
}

