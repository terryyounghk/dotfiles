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

