# https://github.com/junegunn/fzf

# dracula theme: https://draculatheme.com/fzf

FZF_DRACULA_THEME="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

export FZF_DEFAULT_OPTS="--tmux 90% --layout=reverse --inline-info ${FZF_DRACULA_THEME}"

# export FZF_CTRL_T_COMMAND="command fd -H --no-ignore-vc-E .git -td -tf"
