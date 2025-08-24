alias df='df -H'
alias du='du -ch'
alias dv='diskutil list' # list disk volumes with diskutil
alias fv='find /Volumes -maxdepth 1' # list top-level volumes with find
alias lv='list-volumes'
alias sv='smbutil view' # e.g. sv //ark@192.168.1.103
alias li='list_indexing' # see utility.zsh

# -----------------------------------------------------------------------------------

# Function to list volumes interactively with fzf
list-volumes() {
  local selected_volume
  local volume_query='find /Volumes -maxdepth 1 -type d ! -path "/Volumes" ! -path "/Volumes/com.apple.TimeMachine.localsnapshots" ! -path "/Volumes/.timemachine"'
  selected_volume=$(eval $volume_query | \
    fzf --prompt="Select a volume: " \
        --height=40% \
        --header $'Enter: Insert path | C-y: Copy path | C-n: Copy name\nC-d: Disable indexing | C-e: Enable indexing | C-r: Rebuild indexing' \
        --preview 'echo "Disk Usage:\nSize\tUsed\tAvail\tCapacity"; df -h {} | tail -1 | awk "{print \$2 \"\t\" \$3 \"\t\" \$4 \"\t\" \$5}"; echo "\nIndexing Status:"; mdutil -s {} 2>/dev/null' \
        --preview-window right:50% \
        --bind 'enter:execute(echo {+} | tr -d "\n" | pbcopy)+accept' \
        --bind 'ctrl-y:execute(echo {+} | tr -d "\n" | pbcopy)' \
        --bind 'ctrl-n:execute(basename {+} | tr -d "\n" | pbcopy)' \
        --bind 'ctrl-d:execute(mdutil -i off {} > /dev/null)+reload(eval '$volume_query')' \
        --bind 'ctrl-e:execute(mdutil -i on {} > /dev/null)+reload(eval '$volume_query')' \
        --bind 'ctrl-r:execute(mdutil -E {} > /dev/null)+reload(eval '$volume_query')'
  )
  if [[ -n "$selected_volume" ]]; then
    if [[ -n "$ZLE_STATE" ]]; then
      LBUFFER="${LBUFFER}${selected_volume}"
      zle reset-prompt
    else
      echo "$selected_volume"
    fi
  fi
}

# Register the zsh widget for list-volumes
zle -N list-volumes

# Bind Ctrl+V to list-volumes widget (check for conflicts with: bindkey | grep '^V')
bindkey '^V' list-volumes
