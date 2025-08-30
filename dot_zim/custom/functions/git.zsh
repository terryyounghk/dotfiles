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

# https://github.com/zimfw/zimfw/discussions/501
git-current-branch () {
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
