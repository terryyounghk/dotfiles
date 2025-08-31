# -----------------------------------------------------------------------------------
# terminal

alias cls='clear && start'
alias ra='reload_aliases'
alias rall='reload_all'
alias rt='reload_terminal'
alias rr='ra && rt'
alias start='macchina'

# -----------------------------------------------------------------------------------
# brew: https://docs.brew.sh/Manpage

alias bubu='brew updates; brew upgrade --require-sha' # then append whatever specific formulae/cask

# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# misc utils

alias cat='bat'
alias cal='cal -y'
alias plist='/usr/libexec/PlistBuddy' # e.g. plist -c "print" ~/Library/Preferences/.GlobalPreferences.plist

# -----------------------------------------------------------------------------------
# tmux

alias t=' TERM=tmux-256color tmux attach || tmux new-session'
alias ta=' TERM=tmux-256color tmux attach -t'
alias tl=' tmux list-sessions'

# -----------------------------------------------------------------------------------
# nvim / vim

alias n=" nvim -c 'set shada= noswapfile noundofile nobackup nowritebackup noshelltemp history=0 nomodeline secure'"
alias m=' n' # I keep fat-fingering 'm' on a Corne for some reason
alias vi=' vi -i NONE' # do not use viminfo file


# -----------------------------------------------------------------------------------
# file cleaning

# alias clean-mac-files="find . -type f -name '*.DS_Store' -ls -delete"

# my preferred ls
alias eza='eza -lgh --icons --git --group-directories-first'
alias l='eza --icons --git-ignore'
alias ll='eza --all --all'
alias lk='l --tree --level=1'
alias lj='l --tree --level=2'
alias lh='l --tree --level=3'

# mkdir create [p]arent directories and [v]erbose
alias mpv='mkdir -pv'


# -----------------------------------------------------------------------------------
# node

# for ts-node 9.x
alias nsa='node --require source-map-support/register'

# for ts-node 10.x
alias nsb='node --require @cspotcode/source-map-support/register'

# -----------------------------------------------------------------------------------
# python stuff

alias jn='Jupyter Notebook'
