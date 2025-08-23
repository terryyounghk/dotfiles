# zsh-abbr
# https://zsh-abbr.olets.dev/

alias Ab='abbr'
alias Ag='abbr --global'
alias AG='Ag'
alias Aa='Ag add'
alias Ac='abbr clear-session'
alias Ae='Ag erase'
alias Afl='Als | fzf --multi'
alias Afa='Ala | fzf --multi'
alias Afc='Alc | fzf --multi'
alias Ax='abbr expand'
alias Agit='abbr git'
alias Axa='abbr export-alias'
alias Ai='Ag import-aliases'
alias Aig='abbr import-git-aliases --prefix g'
alias Als='abbr list'
alias Ala='abbr list-abbreviations'
alias Alc='abbr list-commands'
alias Ar='abbr_truncate_user_abbreviations_file && Ai'
alias Ara='reload_aliases'
alias Arq='abbr_truncate_user_abbreviations_file && Ai --quieter'

# -----------------------------------------------------------------------------------

function abbr_truncate_user_abbreviations_file () {
  local f="$ABBR_USER_ABBREVIATIONS_FILE"
  truncate -s 0 "$f" || touch "$"
}
