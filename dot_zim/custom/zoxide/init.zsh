# the following should mostly resemble $FZF_CTRL_T_COMMAND

zoxide_fzf_directory () {
  z $($FZF_ALT_C_COMMAND | fzf)
}

zoxide_fzf_files () {
  z $($FZF_CTRL_T_COMMAND | fzf)
}

