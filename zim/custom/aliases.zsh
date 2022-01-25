alias reload!='. ~/.zshrc'

################################################################################
# supporting functions
################################################################################

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

################################################################################
# These are my lazy aliases from a to z
# My muscle-memory dictates this list, and these are subject to change.
################################################################################

# [a] reserved for fasd
    #alias a='fasd -a' # files and directories

# [b]ack to previous wd
    alias b='cd -'

# [c]leanup - recursively delete .DS_Store files
    alias c="find . -type f -name '*.DS_Store' -ls -delete"
    alias cs='cht.sh'
    alias csh='cht.sh --shell'

# [d] reserved for fasd
    #alias d='fasd -d'

# [e]dit file (uses fasd, i'm not using $DOTS/bin/e that much)
    #alias e=''

# [f] reserved for fasd
    #alias f='fasd -f'

# [g]oogle whatever is on the clipboard
    alias g='google'
    alias gclip='google "\"`pbpaste`\""'

# [h] reserved for /function h()
    #alias h='h'

# [i]p address
    alias i='myip'

# [j]ump to directory in finder using fasd
    #alias j=''

# [k] Quic[k]-loo[k] a file (requires oh-my-zsh-osx plugin)
    alias k='quick-look'

# [l]s : the one I most frequently use
    alias l='ls -al'

# [m]ou
    alias m='open -n /Applications/mou.app'

# [n]avi
    alias n='navi'
    alias nq='navi -q'
    alias nc='navi --cheatsh'

# [o]pen current directory in finder
    alias o='open .'

# [p]review man (requires oh-my-zsh osx plugin)
    alias p='man-preview'

# [q]uit terminal
    alias q='exit'

# [r]epo directory (bare)
    alias r='cd ~/repo'

# [s] reserved for fasd
    #alias s='fasd -si'

# [t]re -L . Requires $DOTS/bin/tre. Usage: t 1, t 2, t 3...
    alias t='tre -L'

# [u]ltimateVideoConverter
    alias u='open -n /Applications/videoconverterultimate.app'

# [v]lc
    alias v='open -n /Applications/vlc.app'

# [w]orking directory
    alias w='cd ~/wd'

# [x] killall
    alias x='killall'

# [y]
    alias y='google'

# [z] reserved for fasd
    #alias z='fasd_cd -d'

################################################################################
# My other aliases
################################################################################

alias home='cd ~'

alias fid='fasd -i -d' # just to find and list directories
alias fap='fasd-app'
alias fd='fasd-cd'
alias fcode='fasd-vscode'
alias fcot='fasd-cot'
alias fidea='fasd-idea'
alias finder='fasd-finder'

# Open FileZilla from command line to work with Yubikey
# Reference: https://superuser.com/questions/1383380/filezilla-on-mac-yubikey-authentication
alias fz='/Applications/FileZilla.app/Contents/MacOS/filezilla'
alias filezilla='fz'

# ssh related aliases
alias saa='ssh-add -A'
alias sal='ssh-add -l'
alias saL='ssh-add -L'
alias sak='ssh-add -K'
