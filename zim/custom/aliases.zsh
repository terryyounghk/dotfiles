alias reload!='. ~/.zshrc'
alias rl='reload!'

# -----------------------------------------------------------------------------------
# general

# list alias starting with ...
function lal () {
  alias | grep "^$1"
}

print-head () {
  printf "%b\r\033[00;36m$1\033[0m\n"
}

print-line () {
  printf "%b\r  \033[0m$1\033[0m\n"
}

print-temp () {
  printf "\r  [ \033[00;34m..\033[0m ] $1"
}

print-info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

print-user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

print-pass () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

print-fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# -----------------------------------------------------------------------------------
# replacements
# https://ivergara.github.io/Supercharging-shell.html

alias cat='bat'
alias cal='cal -y'
#alias ls='exa'

# -----------------------------------------------------------------------------------
# zim

# edit zim files
alias ze='vi $DOTFILES/zim/custom/_work/'

# -----------------------------------------------------------------------------------
# file system

# back
alias b='cd -'

# clean files
alias c="find . -type f -name '*.DS_Store' -ls -delete"

# home
alias home='cd ~'

# fuzzy fasd_cd
alias f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# my preferred ls
#alias l='ls -al'
alias exa='exa -lgh --icons --time-style=iso --git --group-directories-first'
alias l='exa --icons --git-ignore'
alias ll='exa --all'
alias lk='l --tree --level=1'
alias lj='l --tree --level=2'
alias lh='l --tree --level=3'

# mkdir create [p]arent directories and [v]erbose
alias mkdir='mkdir -pv'

alias df='df -H'
alias du='du -ch'


# -----------------------------------------------------------------------------------
# yarn

alias y='yarn'
alias yi='yarn install'
alias yb='yarn build'
alias yt='yarn test'
alias ye='yarn e2e'
alias yl='yarn lint'
alias ys='yarn start'

# -----------------------------------------------------------------------------------
# git

#alias log1="log --graph --pretty=format:'%Cred%h%Creset %ad %s %C(yellow)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
#alias log2="log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
#alias hist="log --graph --full-history --all --pretty=format:'%Cred%h%Creset %ad %s %C(yellow)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
