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
alias yo='yarn outdated'
alias yu='yarn upgrade'
alias yup='yarn upgrade-interactive --latest'

# -----------------------------------------------------------------------------------
# depcheck
alias dp='npx depcheck'

depcheck-missing () {
  echo "Checking unused dependencies..."
  printf -v var "$(npx depcheck --skip-missing | sed -n '/\* /p' | sed -e 's/\* //' | tr '\n' ' ')"
  if [ ! -z "$var" ];
  then
    echo yarn remove $var
         yarn remove $var
  else
    echo "No missing dependencies"
  fi
}

alias dpm='depcheck-missing'

# -----------------------------------------------------------------------------------
# node

# for ts-node 9.x
alias nsa='node --require source-map-support/register'

# for ts-node 10.x
alias nsb='node --require @cspotcode/source-map-support/register'

# -----------------------------------------------------------------------------------
# history

history-grep () {
  history | grep $1
}

# -----------------------------------------------------------------------------------
# hist, see https://github.com/marlonrichert/zsh-hist

alias h=hi

# [h]ist [a]ll
alias ha="hist l $'*'"

# [h]ist [t]en entries
alias ht='hist l {-1..-10}'

alias hh='hist help'
alias hf='hist f'
alias hfl='hist f -1'
alias hl='hist l'
alias hll='hist l -1'
alias hr='hist reload'
alias hg='hist g'
alias hgl='hist g -1'
alias hd='hist d'
alias hdl='hist d -1'

# interactive with fzf

# [h]ist [i]nteractive
hi () {
  local cmd=$1
  local sel
  local items
  local choice

  case $cmd in
    "copy" | "c" | "compress" | "d" | "delete" | "e" | "edit" | "f" | "fix" | "g" | "get" | "l" | "list" | "n" | "normalize")
      ;;
    *)
      items=("1. compress" "2. delete" "3. edit" "4. fix" "5. get" "6. list" "7. normalize" "8. copy")
      cmd=$(printf "%s\n" "${items[@]}" | fzf --header="Choose a hist command:" | ifne cut -d ' ' -f 2-)
      ;;
  esac

  if [ "$cmd" = "" ]; then
    echo "No command selected. Default to 'get'."
    cmd=get
  fi

  echo "Selected command: $cmd"

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------
  #     list all from hist
  #     |             remove color codes
  #     |             |                                  sort reversed
  #     |             |                                  |         multi select
  #     |             |                                  |         |        trim leading/trailing spaces from each line
  #     |             |                                  |         |        |                 replace multiple spaces with one
  #     |             |                                  |         |        |                 |           cut first column to get only the entry numbers
  #     |             |                                  |         |        |                 |           |                 join lines with space as separator
  #     |             |                                  |         |        |                 |           |                 |
  sel=$(hist l $'*' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | sort -r | fzf -m | awk '{$1=$1};1' | tr -s ' ' | cut -d ' ' -f 1 | tr '\n' ' ')

  if [ "$sel" = "" ]; then
    echo "No selection from hist. Abort."
    return 1
  fi

  echo "Selected hist entries: $sel"

  case $cmd in
    "copy")
      # ------------------------------------------------------------------------------------
      #                                           get everything after the first space
      #                                           |                  copy to clipboard
      #                                           |                  |
      hist g $(echo $sel) | awk '{$1=$1};1' | tr -s ' ' | cut -d ' ' -f 2- | pbcopy
      echo "The following commands are copied to clipboard:"
      hist l $(echo $sel)
      ;;
    *)
      # echo hist $cmd $(echo $sel)
      # don't know why $sel need echo but it works for now (macos)
      hist $cmd $(echo $sel)
      ;;
  esac
}

# -----------------------------------------------------------------------------------
# git

# https://github.com/zimfw/zimfw/discussions/501
git_current_branch () {
        local ref
        ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
        local ret=$?
        if [[ $ret != 0 ]]
        then
                [[ $ret == 128 ]] && return
                ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return
        fi
        echo ${ref#refs/heads/}
}

#alias log1="log --graph --pretty=format:'%Cred%h%Creset %ad %s %C(yellow)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
#alias log2="log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
#alias hist="log --graph --full-history --all --pretty=format:'%Cred%h%Creset %ad %s %C(yellow)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
