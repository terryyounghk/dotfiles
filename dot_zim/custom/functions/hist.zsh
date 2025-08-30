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

hist-interactive () {
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
