
# ---------------------------------------------
# https://github.com/clvv/fasd/issues/24
eval "$(fasd --init auto)"
# ---------------------------------------------

# list recent apps and open new instance
function fasd-app () {
  echo 'open -n ...'
  s -i $1 .app$ -e 'open -n'
}

# list recent items and open in code
function fasd-vscode () {
  echo 'code ...'
  if [ "$1" = "." ] ; then
    code .
  else
    s -i $1 -e code
  fi
}

# list recent items and open in IntelliJ Idea
function fasd-idea () {
  echo 'code ...'
  if [ "$1" = "." ] ; then
    idea .
  else
    s -i $1 -e idea
  fi
}

# list recent items and open in CotEditor
function fasd-cot () {
  echo 'code ...'
  if [ "$1" = "." ] ; then
    cot .
  else
    s -i $1 -e cot
  fi
}

# list recent directories and open in finder
function fasd-finder () {
  echo 'open in finder ...'
  d -i $1 -e 'open'
}

function fasd-cd () {
  echo 'cd to directory ...'
  fasd_cd -d -i $1
}

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
unalias z
function z () {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

alias fid='fasd -i -d' # just to find and list directories
alias fap='fasd-app'
alias fa='fasd-cd'
alias fcode='fasd-vscode'
alias fcot='fasd-cot'
alias fidea='fasd-idea'
alias finder='fasd-finder'

alias j=z
alias jj=zz
