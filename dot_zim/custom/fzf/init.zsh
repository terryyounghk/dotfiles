# https://github.com/junegunn/fzf

# sometimes I just want to look up some of these
alias faf='alias | fzf --multi'
alias fenv='printenv | fzf --multi'

# ----------------------------------------------------------
# options start

# dracula theme: https://draculatheme.com/fzf
FZF_DRACULA_THEME="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

export FZF_DEFAULT_OPTS="--tmux 90% --layout=reverse --inline-info ${FZF_DRACULA_THEME}"

FZF_COMMON_COMMAND_PORTION="fd --hidden --no-ignore --exclude .git"

# default command to use when input is tty
export FZF_DEFAULT_COMMAND="${FZF_COMMON_COMMAND_PORTION} --type f --type d"

# list files and directories
export FZF_CTRL_T_COMMAND="${FZF_COMMON_COMMAND_PORTION} --type f --type d"

# list directories only
export FZF_ALT_C_COMMAND="${FZF_COMMON_COMMAND_PORTION} --type d"

# options end
# ----------------------------------------------------------

