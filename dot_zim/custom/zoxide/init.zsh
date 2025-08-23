# zoxide

alias zb='z -'
alias zd='zoxide_fzf_directory'
alias zf='zoxide_fzf_files'
alias zy='zoxide_fzf_any'

# -----------------------------------------------------------------------------------

# the following should mostly resemble $FZF_CTRL_T_COMMAND

zoxide_fzf_directory () {
  z $($FZF_ALT_C_COMMAND | fzf)
}

zoxide_fzf_files () {
  z $($FZF_CTRL_T_COMMAND | fzf)
}

