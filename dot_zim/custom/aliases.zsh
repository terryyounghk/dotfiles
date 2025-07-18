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
# yazi: https://github.com/sxyazi/yazi

alias y='yazi'
alias ypa='ya pkg add'
alias ypd='ya pkg delete'
alias ypi='ya pkg install'
alias ypu='ya pkg upgrade'
alias ypl='ya pkg list'
alias ypr='chezmoi re-add ~/.config/yazi/package.toml'

# -----------------------------------------------------------------------------------
# fzf: https://github.com/junegunn/fzf

# sometimes I just want to look up some of these
alias faf='alias | fzf --multi'
alias fenv='printenv | fzf --multi'
alias fpf='fzf_process_list'

# -----------------------------------------------------------------------------------
# zoxide

alias zb='z -'
alias zd='zoxide_fzf_directory'
alias zf='zoxide_fzf_files'
alias zy='zoxide_fzf_any'

# -----------------------------------------------------------------------------------
# misc utils

alias cat='bat'
alias cal='cal -y'
alias df='df -H'
alias du='du -ch'
alias plist='/usr/libexec/PlistBuddy' # e.g. plist -c "print" ~/Library/Preferences/.GlobalPreferences.plist

# -----------------------------------------------------------------------------------
# zsh-abbr

function abbr_truncate_user_abbreviations_file () {
  local f="$ABBR_USER_ABBREVIATIONS_FILE"
  truncate -s 0 "$f" || touch "$"
}


alias Ab='abbr'
alias Ag='abbr --global'
alias AG='Ag'
alias Aa='Ag add'
alias Ac='abbr clear-session'
alias Ae='Ag erase'
alias Afl='Als | fzf --multi'
alias Afa='Ala | fzf --multi'
alias Afc='Alc | fzf --multi'
alias Ax='abbr expand'
alias Agit='abbr git'
alias Axa='abbr export-alias'
alias Ai='Ag import-aliases'
alias Aig='abbr import-git-aliases --prefix g'
alias Als='abbr list'
alias Ala='abbr list-abbreviations'
alias Alc='abbr list-commands'
alias Ar='abbr_truncate_user_abbreviations_file && Ai'
alias Ara='reload_aliases'
alias Arq='abbr_truncate_user_abbreviations_file && Ai --quieter'

# -----------------------------------------------------------------------------------
# tmux

alias t='TERM=tmux-256color tmux attach || tmux new-session'
alias ta='TERM=tmux-256color tmux attach -t'
alias tl='tmux list-sessions'

# -----------------------------------------------------------------------------------
# nvim

alias n='nvim'
alias m='nvim' # I keep fat-fingering 'm' on a Corne for some reason

# -----------------------------------------------------------------------------------
# chezmoi

alias cm='chezmoi'
alias cmc='chezmoi cd'
alias cme='chezmoi edit'
alias cma='chezmoi apply'
alias cmf='chezmoi forget'
alias cmg='chezmoi edit-config-template'
alias cmi='chezmoi init'
alias cmai='chezmoi-fzf-apply'
alias cmadd='chezmoi-add-or-re-add'
alias cmaf='chezmoi-fzf-add'
alias cmm='chezmoi managed'
alias cmmi='chezmoi-fzf-managed'

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
# yarn v1 stuff

alias yi='yarn install'
alias yb='yarn build'
alias yt='yarn test'
alias ye='yarn e2e'
alias yl='yarn lint'
alias ys='yarn start'
alias yo='yarn outdated'
alias yu='yarn upgrade'
alias yup='yarn upgrade-interactive --latest'

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
# hist, see https://github.com/marlonrichert/zsh-hist

# [h]ist [a]ll
alias ha='hist list * | fzf'

# [h]ist [p]rint [a]ll
alias hap="hist list $'*'"

# [h]ist [t]en entries
alias ht="echo '10 most recent commands...'; hist list {-1..-10}"

alias hh='hist help'
alias hi='hist-interactive'
alias hf='hist fix'

# [h]ist [f]ix [l]ast
alias hfl='hist fix -1'
alias hl='hist list'
alias hll='hist list -1'
alias hr='hist reload'
alias hg='hist get'
alias hgl='hist get -1'
alias hd='hist delete'
alias hdl='hist delete -1'

# [h]ist [y]ank
alias hy='ha | pbcopy'

# -----------------------------------------------------------------------------------
# git

alias Gcb="git-current-branch"
alias Gfl="git config --local --list"
alias Gfg="git config --global --list"
alias Gcsm="git commit -S -m"
alias Gfv="git fetch --all --verbose --prune"
alias Gsg="git log --show-signature -n 1"
alias Gu="git status"
alias GL="git log --all --graph --pretty=format:'%C(yellow)%h%Creset %Cgreen%ad%Creset %C(bold)signed:%Creset%C(auto)%G?%Creset %C(bold blue)<%an>%Creset %s %C(auto)%d%Creset' --date=short"

# -----------------------------------------------------------------------------------
# python stuff

alias jn='Jupyter Notebook'
