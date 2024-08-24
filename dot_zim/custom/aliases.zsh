# -----------------------------------------------------------------------------------
# system

# reload
alias -g rl='. ~/.zshrc'

# -----------------------------------------------------------------------------------
# fzf

alias -g fzf-alias='alias | fzf'

# -----------------------------------------------------------------------------------
# jumps
alias -g b='cd -'
alias -g home='cd ~'

# alias -g zm='z zmk'
# alias -g zc='z common'
# alias -g zd='z $DOTFILES'
# alias -g zk='z kbds'
# alias -g zm='z monitors'
# alias -g zp='cd ~/Library/Preferences'
# alias -g zr='cd ~/Library/Rime'
# alias -g zw='cd ~/wd'
# alias -g zt='z tooling'

# -----------------------------------------------------------------------------------
# misc utils
alias -g cat='bat'
alias -g cal='cal -y'
alias -g df='df -H'
alias -g du='du -ch'
alias -g m='macchina'

# -----------------------------------------------------------------------------------
# zsh-abbr
alias -g v='abbr'
alias -g vv="abbr import-aliases --quieter --global"
alias -g vvv="vi $(echo $ABBR_USER_ABBREVIATIONS_FILE)"

# -----------------------------------------------------------------------------------
# tmux
alias -g t='TERM=screen-256color tmux attach || tmux new-session'
alias -g ta='TERM=screen-256color tmux attach -t'
alias -g tl='tmux list-sessions'

# -----------------------------------------------------------------------------------
# zim

# edit zim files
alias -g ze='vi $DOTFILES/zim/custom/_work/'
# alias -g tmux="TERM=screen-256color tmux"

# -----------------------------------------------------------------------------------
# file ops

# clean files
alias -g c="find . -type f -name '*.DS_Store' -ls -delete"

# TODO: forgot what this does, should have documented it
alias -g f='cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)'

# find files and directories within a path
# use case: chezmoi add $(fd -u . ~/.zim)
alias -g fdu='fd -u .'

fdf () {
  fd -u . "$1" | fzf
}

# my preferred ls
alias -g eza='eza -lgh --icons --git --group-directories-first'
alias -g l='eza --icons --git-ignore'
alias -g ll='eza --all --all'
alias -g lk='l --tree --level=1'
alias -g lj='l --tree --level=2'
alias -g lh='l --tree --level=3'

# mkdir create [p]arent directories and [v]erbose
alias -g mpv='mkdir -pv'

# -----------------------------------------------------------------------------------
# yarn v1 stuff
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
# hist, see https://github.com/marlonrichert/zsh-hist

# [h]ist [a]ll
alias -g ha='hist list * | fzf'

# [h]ist [p]rint [a]ll
alias -g hap="hist list $'*'"

# [h]ist [t]en entries
alias -g ht="echo '10 most recent commands...'; hist list {-1..-10}"

alias -g hh='hist help'
alias -g hi='hist-interactive'
alias -g hf='hist fix'

# [h]ist [f]ix [l]ast
alias -g hfl='hist fix -1'
alias -g hl='hist list'
alias -g hll='hist list -1'
alias -g hr='hist reload'
alias -g hg='hist get'
alias -g hgl='hist get -1'
alias -g hd='hist delete'
alias -g hdl='hist delete -1'

# [h]ist [y]ank
alias -g hy='ha | pbcopy'

# -----------------------------------------------------------------------------------
# git

alias -g Gcb="git-current-branch"
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

