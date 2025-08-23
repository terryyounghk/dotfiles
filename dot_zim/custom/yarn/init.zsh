# https://yarnpkg.com
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
alias dpm='depcheck-missing'

if (( $+commands[yarn] ))
then
  export PATH="$PATH:`yarn global bin`"
fi

# -----------------------------------------------------------------------------------

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
