# -----------------------------------------------------------------------------------
# terminal

alias -g cls='clear; start'
alias -g ra='reload_aliases'
alias -g rall='reload_all'
alias -g rt='reload_terminal'
alias -g start='macchina'

# -----------------------------------------------------------------------------------
# brew: https://docs.brew.sh/Manpage

alias -g bubu='brew updates; brew upgrade --require-sha' # then append whatever specific formulae/cask

# -----------------------------------------------------------------------------------
# fzf: https://github.com/junegunn/fzf

# sometimes I just want to look up some of these
alias -g faf='alias | fzf --multi'
alias -g fef='printenv | fzf --multi'

# -----------------------------------------------------------------------------------
# zoxide

alias -g zb='z -'
alias -g zc='z common'
alias -g zk='z kbds'
alias -g zl='z ~/Library/'
alias -g zm='z monitors'
alias -g zmk='z zmk-config'
alias -g zt='z tooling'
alias -g zv='z /Volumes/'

# -----------------------------------------------------------------------------------
# misc utils

alias -g cat='bat'
alias -g cal='cal -y'
alias -g df='df -H'
alias -g du='du -ch'

# -----------------------------------------------------------------------------------
# zsh-abbr

function abbr_truncate_user_abbreviations_file () {
  local f="$ABBR_USER_ABBREVIATIONS_FILE"
  truncate -s 0 "$f" || touch "$"
}


alias -g Ab='abbr'
alias -g Ag='abbr --global'
alias -g AG='Ag'
alias -g Aa='Ag add'
alias -g Ac='abbr clear-session'
alias -g Ae='Ag erase'
alias -g Afl='Als | fzf --multi'
alias -g Afa='Ala | fzf --multi'
alias -g Afc='Alc | fzf --multi'
alias -g Ax='abbr expand'
alias -g Agit='abbr git'
alias -g Axa='abbr export-alias'
alias -g Ai='Ag import-aliases'
alias -g Aig='abbr import-git-aliases -g --prefix g'
alias -g Als='abbr list'
alias -g Ala='abbr list-abbreviations'
alias -g Alc='abbr list-commands'
alias -g Ar='abbr_truncate_user_abbreviations_file && Ai'
alias -g Ara='reload_aliases'
alias -g Arq='abbr_truncate_user_abbreviations_file && Ai --quieter'

# -----------------------------------------------------------------------------------
# tmux
 
alias -g t='TERM=screen-256color tmux attach || tmux new-session'
alias -g ta='TERM=screen-256color tmux attach -t'
alias -g tl='tmux list-sessions'

# -----------------------------------------------------------------------------------
# chezmoi

alias -g cm='chezmoi'
alias -g cmc='chezmoi cd'
alias -g cme='z ~/.local/share/chezmoi/; chezmoi edit --apply'
alias -g cma='chezmoi apply'
alias -g cmr='chezmoi-add-or-re-add'
alias -g cmi='chezmoi-fzf-add'
alias -g cmm='chezmoi managed | fzf'

# -----------------------------------------------------------------------------------
# file cleaning

# alias -g clean-mac-files="find . -type f -name '*.DS_Store' -ls -delete"

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

