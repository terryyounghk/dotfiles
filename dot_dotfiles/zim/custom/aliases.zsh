# reload
alias -g rl='. ~/.zshrc'

# -----------------------------------------------------------------------------------
# general

# list alias -g starting with ...
function lal () {
  alias -g | grep "^$1"
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
# stuff
alias -g m='macchina'
alias -g v='abbr'
alias -g vv="abbr import-aliases --quieter --global"
alias -g vvv="vi $(echo $ABBR_USER_ABBREVIATIONS_FILE)"

# -----------------------------------------------------------------------------------
# replacements
# https://ivergara.github.io/Supercharging-shell.html

alias -g cat='bat'
alias -g cal='cal -y'
#alias -g ls='exa'

# -----------------------------------------------------------------------------------
# zim

# edit zim files
alias -g ze='vi $DOTFILES/zim/custom/_work/'
alias -g t='TERM=screen-256color tmux'
# alias -g tmux="TERM=screen-256color tmux"

# -----------------------------------------------------------------------------------
# file system

# back
alias -g b='cd -'

# clean files
alias -g c="find . -type f -name '*.DS_Store' -ls -delete"

# home
alias -g home='cd ~'

# fuzzy fasd_cd
alias -g f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# my preferred ls
alias -g eza='eza -lgh --icons --git --group-directories-first'
alias -g l='eza --icons --git-ignore'
alias -g ll='eza --all --all'
alias -g lk='l --tree --level=1'
alias -g lj='l --tree --level=2'
alias -g lh='l --tree --level=3'

# mkdir create [p]arent directories and [v]erbose
alias -g mpv='mkdir -pv'

alias -g df='df -H'
alias -g du='du -ch'

# quick jumps
alias -g zd='cd $DOTFILES'
alias -g zk='z kbds'
alias -g zr='cd ~/Library/Rime'
alias -g zw='cd ~/wd'
alias -g zp='cd ~/Library/Preferences'

# -----------------------------------------------------------------------------------
# yarn

alias -g y='yarn'
alias -g yi='yarn install'
alias -g yb='yarn build'
alias -g yt='yarn test'
alias -g ye='yarn e2e'
alias -g yl='yarn lint'
alias -g ys='yarn start'
alias -g yo='yarn outdated'
alias -g yu='yarn upgrade'
alias -g yup='yarn upgrade-interactive --latest'

# -----------------------------------------------------------------------------------
# depcheck
alias -g dp='npx depcheck'

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

alias -g dpm='depcheck-missing'

# -----------------------------------------------------------------------------------
# node

# for ts-node 9.x
alias -g nsa='node --require source-map-support/register'

# for ts-node 10.x
alias -g nsb='node --require @cspotcode/source-map-support/register'

# -----------------------------------------------------------------------------------
# history

history-grep () {
  history | grep $1
}

# -----------------------------------------------------------------------------------
# hist, see https://github.com/marlonrichert/zsh-hist

alias -g hi=hist-interactive

# [h]ist [a]ll
alias -g ha="hist list $'*'"

# [h]ist [t]en entries
alias -g ht='hist list {-1..-10}'

alias -g hh='hist help'
alias -g hf='hist fix'
alias -g hfl='hist fix -1'
alias -g hl='hist list'
alias -g hll='hist listj -1'
alias -g hr='hist reload'
alias -g hg='hist get'
alias -g hgl='hist get -1'
alias -g hd='hist delete'
alias -g hdl='hist delete -1'

# interactive with fzf

# [h]ist [i]nteractive
hist-interactive () {
  set -x
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
  sel=$(hist list $'*' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | sort -r | fzf -m | awk '{$1=$1};1' | tr -s ' ' | cut -d ' ' -f 1 | tr '\n' ' ')

  if [ "$sel" = "" ]; then
    echo "No selection from hist. Abort."
    return 1
  fi

  echo "Selected hist entries: $sel"

  case $cmd in
    "copy")
      # ------------------------------------------------------------------------------------
      #                                             get everything after the first space
      #                                             |                   copy to clipboard
      #                                             |                   |
      hist get $(echo $sel) | awk '{$1=$1};1' | tr -s ' ' | cut -d ' ' -f 2- | pbcopy
      echo "The following commands are copied to clipboard:"
      hist list $(echo $sel)
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

alias -g Gcb="git_current_branch"
alias -g Gfl="git config --local --list"
alias -g Gfg="git config --global --list"
alias -g Gcsm="git commit -S -m"
alias -g Gfv="git fetch --all --verbose --prune"
alias -g Gsg="git log --show-signature -n 1"
alias -g Gu="git status"
alias -g GL="git log --all --graph --pretty=format:'%C(yellow)%h%Creset %Cgreen%ad%Creset %C(bold)signed:%Creset%C(auto)%G?%Creset %C(bold blue)<%an>%Creset %s %C(auto)%d%Creset' --date=short"

# -----------------------------------------------------------------------------------
# python stuff
alias jn='Jupyter Notebook'
