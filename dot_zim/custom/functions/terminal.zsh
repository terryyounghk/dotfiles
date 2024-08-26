function reload_terminal () {
  clear
  source ~/.zshrc
  macchina
}

function _get_abbr_user_abbreviations_file_line_count () {
  sed -n '$=' $ABBR_USER_ABBREVIATIONS_FILE 2> /dev/null || echo 0
}

function reload_aliases () {
  echo "Updating $ABBR_USER_ABBREVIATIONS_FILE:"
  echo "Before updating: $(_get_abbr_user_abbreviations_file_line_count) aliases"
  eza --all --all --time-style="+%F %H:%M:%S" $ABBR_USER_ABBREVIATIONS_FILE

  abbr_truncate_user_abbreviations_file

  abbr --global import-aliases --quieter
  abbr import-git-aliases -g --prefix G

  echo "After updating: $(_get_abbr_user_abbreviations_file_line_count) aliases"
  eza --all --all --time-style="+%F %H:%M:%S" $ABBR_USER_ABBREVIATIONS_FILE
}

function reload_all () {
  reload_terminal
  reload_aliases
}

