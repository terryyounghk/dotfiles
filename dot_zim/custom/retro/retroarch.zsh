# Helper functions for basic RetroArch Config Management
# Certain defaults are opinionated for my devices and setup

alias Ra='retroarch_cfg_apply'
alias Rd='retroarch_cfg_diff'
alias Re='retroarch_cfg_edit'
alias Rg='retroarch_cfg_get'
alias Rs='retroarch_cfg_set'
alias Rp='retroarch_cfg_backup'

# TODO: Backup location is PWD by default. Add a better default and also param to specify location.

# Defaults
RA_OVERRIDE_CFG="${HOME}/.zim/custom/retro/retroarch.cfg.overrides"
RA_LOCAL_CFG="${HOME}/Library/Application Support/RetroArch/config/retroarch.cfg"
RA_LOCAL_EDITOR="nvim"
RA_REMOTE_USER="ark"
RA_REMOTE_HOST="rgb30"
RA_REMOTE_CFG="/home/${RA_REMOTE_USER}/.config/retroarch/retroarch.cfg"
RA_REMOTE_EDITOR="vi"

# Helper functions
_ra_show_help() {
  local func_name=$1
  local description=$2
  local extra_args=$3

  echo "Usage: ${func_name} [options]${extra_args}"
  echo "${description}"
  echo "Options:"
  echo "  -h, --help      Show this help"
  echo "  -r, --remote    Operate on remote config"
  echo "  -u, --user      SSH username (default: ${RA_REMOTE_USER})"
  echo "  -H, --host      SSH hostname (default: ${RA_REMOTE_HOST})"

  case "$func_name" in
    "retroarch_cfg_edit")
      echo "  -e, --editor    Editor to use (default: ${RA_LOCAL_EDITOR} for local, ${RA_REMOTE_EDITOR} for remote)"
      ;;
    "retroarch_cfg_get")
      echo "  <grep_pattern>  Pattern to search for in config"
      ;;
    "retroarch_cfg_set")
      echo "  -k, --key       Config key to set (required)"
      echo "  -v, --value     New value for key (required)"
      ;;
    "retroarch_cfg_backup")
      echo "  --restore FILE  Restore from backup file"
      ;;
  esac
}

_ra_get_target_cfg() {
  local remote=$1
  if [[ "$remote" == "true" ]]; then
    echo "${RA_REMOTE_CFG}"
  else
    echo "${RA_LOCAL_CFG}"
  fi
}

_ra_exec_remote() {
  local cmd=$1
  ssh "${RA_REMOTE_USER}@${RA_REMOTE_HOST}" "$cmd"
}

_ra_file_exists() {
  local file=$1
  local remote=$2

  if [[ "$remote" == "true" ]]; then
    _ra_exec_remote "[ -f \"${file}\" ]" &>/dev/null
  else
    [ -f "${file}" ]
  fi
}

# Main functions
retroarch_cfg_apply() {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        _ra_show_help "retroarch_cfg_apply" "Apply overrides to RetroArch config"
        echo "  -a, --all       Apply overrides to both local and remote configs"
        return 0
    fi

    local remote=false
    local all=false
    local user=$RA_REMOTE_USER
    local host=$RA_REMOTE_HOST

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r|--remote) remote=true ;;
            -a|--all) all=true ;;
            -u|--user) user=$2; shift ;;
            -H|--host) host=$2; shift ;;
            *) ;;
        esac
        shift
    done

    local target_cfg_local=$(_ra_get_target_cfg false)
    local target_cfg_remote=$(_ra_get_target_cfg true)

    print_info() {
        local target=$1
        local target_cfg=$2
        local override_cfg=$3
        echo "------------------------------------"
        if [[ "$target" == "Local" ]]; then
          echo "Target:          $target"
          echo "Target config:   $target_cfg"
          echo "Override config: $override_cfg"
        else
          echo "Target:          $target"
          echo "Remote user:     $user"
          echo "Remote host:     $host"
          echo "Target config:   $target_cfg"
          echo "Override config: $override_cfg"
        fi
        echo "------------------------------------"
    }

    if $all || ! $remote; then
        print_info "Local" "$target_cfg_local" "$RA_OVERRIDE_CFG"
        retroarch_cfg_apply_local "$target_cfg_local"
    fi

    if $all || $remote; then
        print_info "Remote" "$target_cfg_remote" "${target_cfg_remote}.overrides"
        retroarch_cfg_apply_remote "$user" "$host" "$target_cfg_remote"
    fi
}

retroarch_cfg_apply_local() {
    local target_cfg_local=$1

    if [ ! -f "$RA_OVERRIDE_CFG" ]; then
        echo "Error: Override config not found at ${RA_OVERRIDE_CFG}"
        return 1
    fi

    while IFS= read -r line; do
        line="${line%%\#*}"  # Remove trailing comments
        line="${line#"${line%%[![:space:]]*}"}"  # Trim leading whitespace
        line="${line%"${line##*[![:space:]]}"}"  # Trim trailing whitespace
        if [[ -z "$line" ]]; then
            continue
        fi
        key="${line%%=*}"  # Extract key
        key="${key#"${key%%[![:space:]]*}"}"  # Trim leading whitespace from key
        key="${key%"${key##*[![:space:]]}"}"  # Trim trailing whitespace from key
        if grep -q "^[[:space:]]*${key}[[:space:]]*=" "${target_cfg_local}"; then
            sed -i '' "s|^[[:space:]]*${key}[[:space:]]*=.*|${line}|" "${target_cfg_local}"
            echo "Updated: ${line}"
        else
            echo "Not found: ${key}"
        fi
    done < "$RA_OVERRIDE_CFG"
}

retroarch_cfg_apply_remote() {
    local user=$1
    local host=$2
    local target_cfg_remote=$3

    if ! _ra_file_exists "$target_cfg_remote" true; then
        echo "Error: Remote target config not found at ${target_cfg_remote}"
        return 1
    fi

    local remote_override_cfg="${target_cfg_remote}.overrides"
    echo "Copying Override config to remote: ${remote_override_cfg}"
    scp "$RA_OVERRIDE_CFG" "${user}@${host}:${remote_override_cfg}"

    local remote_script=$(cat <<'EOF'
        target_cfg="$1"
        override_cfg="$2"

        # Print Legend
        echo "------------------------------------"
        echo "Executing on remote: $(hostname)"
        echo "Target: $target_cfg"
        echo "Override Config: $override_cfg"
        echo

        while IFS= read -r line; do
            line="${line%%\#*}"  # Remove trailing comments
            line="${line#"${line%%[![:space:]]*}"}"  # Trim leading whitespace
            line="${line%"${line##*[![:space:]]}"}"  # Trim trailing whitespace
            if [[ -z "$line" ]]; then
                continue
            fi
            key="${line%%=*}"  # Extract key
            key="${key#"${key%%[![:space:]]*}"}"  # Trim leading whitespace from key
            key="${key%"${key##*[![:space:]]}"}"  # Trim trailing whitespace from key
            if grep -q "^[[:space:]]*${key}[[:space:]]*=" "${target_cfg}"; then
                sed -i "s|^[[:space:]]*${key}[[:space:]]*=.*|${line}|" "${target_cfg}"
                echo "Updated: ${line}"
            else
                echo "Not found: ${key}"
            fi
        done < "${override_cfg}"
EOF
    )

    ssh -T "${user}@${host}" bash -s -- "$target_cfg_remote" "$remote_override_cfg" <<< "$remote_script"
}

retroarch_cfg_set() {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        _ra_show_help "retroarch_cfg_set" "Set a specific RetroArch config value"
        return 0
    fi

    local remote=false
    local user=$RA_REMOTE_USER
    local host=$RA_REMOTE_HOST
    local key
    local value

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r|--remote) remote=true ;;
            -u|--user) user=$2; shift ;;
            -H|--host) host=$2; shift ;;
            -k|--key) key=$2; shift ;;
            -v|--value) value=$2; shift ;;
            *) ;;
        esac
        shift
    done

    if [ -z "$key" ] || [ -z "$value" ]; then
        echo "Error: Both --key and --value are required"
        return 1
    fi

    local target_cfg=$(_ra_get_target_cfg $remote)

    if ! _ra_file_exists "$target_cfg" $remote; then
        echo "Error: Target config not found at ${target_cfg}"
        return 1
    fi

    # Always use double quotes for the value
    local new_line="${key} = \"${value}\""

    if $remote; then
        local old_line=$(_ra_exec_remote "grep \"^[[:space:]]*${key}[[:space:]]*=\" \"${target_cfg}\"")
        if [ -n "$old_line" ]; then
            echo "Old: ${old_line}"
            # Properly escape the new line for remote
            local escaped_line=$(printf '%q' "$new_line")
            _ra_exec_remote "sed -i \"s|^[[:space:]]*${key}[[:space:]]*=.*|${escaped_line}|\" \"${target_cfg}\""
            echo "New: ${new_line}"
            # Verify
            _ra_exec_remote "grep \"^[[:space:]]*${key}[[:space:]]*=\" \"${target_cfg}\"" | grep -qF "\"${value}\"" || \
                echo "Warning: Verification failed - please check manually"
        else
            echo "${key} not found"
            return 1
        fi
    else
        local old_line=$(grep "^[[:space:]]*${key}[[:space:]]*=" "${target_cfg}")
        if [ -n "$old_line" ]; then
            echo "Old: ${old_line}"
            sed -i '' "s|^[[:space:]]*${key}[[:space:]]*=.*|${new_line}|" "${target_cfg}"
            echo "New: ${new_line}"
            # Verify
            grep "^[[:space:]]*${key}[[:space:]]*=" "${target_cfg}" | grep -qF "\"${value}\"" || \
                echo "Warning: Verification failed - please check manually"
        else
            echo "${key} not found"
            return 1
        fi
    fi
}

retroarch_cfg_diff() {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        _ra_show_help "retroarch_cfg_diff" "Diff overrides to RetroArch config"
        echo "  -a, --all       Diff overrides to both local and remote configs"
        return 0
    fi

    local remote=false
    local all=false
    local user=$RA_REMOTE_USER
    local host=$RA_REMOTE_HOST

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r|--remote) remote=true ;;
            -a|--all) all=true ;;
            -u|--user) user=$2; shift ;;
            -H|--host) host=$2; shift ;;
            *) ;;
        esac
        shift
    done

    local target_cfg_local=$(_ra_get_target_cfg false)
    local target_cfg_remote=$(_ra_get_target_cfg true)

    print_info() {
        local target=$1
        local target_cfg=$2
        local override_cfg=$3
        echo "------------------------------------"
        if [[ "$target" == "Local" ]]; then
          echo "Target:          $target"
          echo "Target config:   $target_cfg"
          echo "Override config: $override_cfg"
        else
          echo "Target:          $target"
          echo "Remote user:     $user"
          echo "Remote host:     $host"
          echo "Target config:   $target_cfg"
          echo "Override config: $override_cfg"
        fi
        echo "------------------------------------"
    }

    if $all || ! $remote; then
        print_info "Local" "$target_cfg_local" "$RA_OVERRIDE_CFG"
        retroarch_cfg_diff_local "$target_cfg_local"
    fi

    if $all || $remote; then
        print_info "Remote" "$target_cfg_remote" "${target_cfg_remote}.overrides"
        retroarch_cfg_diff_remote "$user" "$host" "$target_cfg_remote"
    fi
}

retroarch_cfg_diff_remote() {
    local user=$1
    local host=$2
    local target_cfg_remote=$3

    if ! _ra_file_exists "$target_cfg_remote" true; then
        echo "Error: Remote target config not found at ${target_cfg_remote}"
        return 1
    fi

    local remote_override_cfg="${target_cfg_remote}.overrides"
    echo "Copying Override config to remote: ${remote_override_cfg}"
    scp "$RA_OVERRIDE_CFG" "${user}@${host}:${remote_override_cfg}"

    local remote_script=$(cat <<'EOF'
        target_cfg="$1"
        override_cfg="$2"

        print_row () {
          printf "%-3s %-30s %-15s %-15s\n" "$1" "$2" "$3" "$4"
        }

        # Print Legend
        echo "------------------------------------"
        echo "Executing on remote: $(hostname)"
        echo "Target: $target_cfg"
        echo "Override Config: $override_cfg"
        echo
        echo "Legend:"
        echo "( ): No diff"
        echo "(*): Has diff"
        echo "(!): Not found"
        # Print header
        print_row "   " "----" "---------" "------"
        print_row "   " "key"  "template"  "actual"
        print_row "   " "----" "---------" "------"

        while IFS="=" read -r key value; do
            key=$(echo "$key" | xargs)
            value=$(echo "$value" | xargs | sed -e 's/^"//' -e 's/"$//')
            current_value=$(grep -E "^${key}\s*=" "${target_cfg}" | cut -d= -f2- | xargs)

            if [ -n "$current_value" ]; then
                diff=" * "
                if [[ "$value" == "$current_value" ]]; then
                    diff="   "
                fi
                print_row "$diff" "$key" "$value" "$current_value"
            else
                diff="!!!"
                print_row "$diff" "$key" "$value" "not found"
            fi
        done < "${override_cfg}"

        echo "End of diff"
EOF
    )

    ssh -T "${user}@${host}" bash -s -- "$target_cfg_remote" "$remote_override_cfg" <<< "$remote_script"
}


retroarch_cfg_diff_local() {
    local target_cfg_local=$1

    if [ ! -f "$RA_OVERRIDE_CFG" ]; then
        echo "Error: Override config not found at ${RA_OVERRIDE_CFG}"
        return 1
    fi

    print_row () {
      printf "%-3s %-30s %-15s %-15s\n" "$1" "$2" "$3" "$4"
    }

    # Print Legend
    echo "RA_OVERRIDE_CFG: $RA_OVERRIDE_CFG"
    echo "Legend:"
    echo "( ): No diff"
    echo "(*): Has diff"
    echo "(!): Not found"
    # Print header
    print_row "   " "----" "---------" "------"
    print_row "   " "key"  "template"  "actual"
    print_row "   " "----" "---------" "------"

    while IFS="=" read -r key value; do
        # echo "key: $key, value: $value, current_value: $current_value"
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs | sed -e 's/^"//' -e 's/"$//')
        current_value=$(grep -E "^${key}\s*=" "${target_cfg_local}" | cut -d= -f2- | xargs)


        if [ -n "$current_value" ]; then
            diff=" * "
            if [[ "$value" == "$current_value" ]]; then
                diff="   "
            fi
            print_row "$diff" "$key" "$value" "$current_value"
        else
            diff="!!!"
            print_row "$diff" "$key" "$value" "not found"
        fi
    done < "$RA_OVERRIDE_CFG"

    echo "End of diff"
}

retroarch_cfg_edit() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    _ra_show_help "retroarch_cfg_edit" "Edit RetroArch config"
    return 0
  fi

  local remote=false
  local user=$RA_REMOTE_USER
  local host=$RA_REMOTE_HOST
  local editor

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -r|--remote) remote=true ;;
      -u|--user) user=$2; shift ;;
      -H|--host) host=$2; shift ;;
      -e|--editor) editor=$2; shift ;;
      *) ;;
    esac
    shift
  done

  if [ -z "$editor" ]; then
    if $remote; then
      editor=$RA_REMOTE_EDITOR
    else
      editor=$RA_LOCAL_EDITOR
    fi
  fi

  local target_cfg=$(_ra_get_target_cfg $remote)

  if $remote; then
    echo "Editing REMOTE config (${user}@${host}:${target_cfg}) with ${editor}"
    ssh -t "${user}@${host}" "${editor} ${target_cfg}"
  else
    echo "Editing LOCAL config (${target_cfg}) with ${editor}"
    [ -f "${target_cfg}" ] || mkdir -p "$(dirname "${target_cfg}")" && touch "${target_cfg}"
    ${editor} "${target_cfg}"
  fi
}

retroarch_cfg_get() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    _ra_show_help "retroarch_cfg_get" "Search RetroArch config"
    return 0
  fi

  local remote=false
  local user=$RA_REMOTE_USER
  local host=$RA_REMOTE_HOST
  local pattern

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -r|--remote) remote=true ;;
      -u|--user) user=$2; shift ;;
      -H|--host) host=$2; shift ;;
      -h|--help) ;;
      *) pattern="$1" ;;
    esac
    shift
  done

  if [ -z "$pattern" ]; then
    echo "Error: grep pattern required"
    return 1
  fi

  local target_cfg=$(_ra_get_target_cfg $remote)

  if ! _ra_file_exists "$target_cfg" $remote; then
    echo "Error: Target config not found at ${target_cfg}"
    return 1
  fi

  if $remote; then
    _ra_exec_remote "grep -E \"${pattern}\" \"${target_cfg}\""
  else
    grep -E "${pattern}" "${target_cfg}"
  fi
}


retroarch_cfg_backup() {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        _ra_show_help "retroarch_cfg_backup" "Backup or restore RetroArch config"
        return 0
    fi

    local remote=false
    local user=$RA_REMOTE_USER
    local host=$RA_REMOTE_HOST
    local restore_file

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -r|--remote) remote=true ;;
            -u|--user) user=$2; shift ;;
            -H|--host) host=$2; shift ;;
            --restore) restore_file=$2; shift ;;
            *) ;;
        esac
        shift
    done

    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local target_cfg=$(_ra_get_target_cfg $remote)

    if [ -n "$restore_file" ]; then
        if $remote; then
            scp "$restore_file" "${user}@${host}:${target_cfg}"
            echo "Restored remote config from ${restore_file}"
        else
            cp "$restore_file" "${target_cfg}"
            echo "Restored local config from ${restore_file}"
        fi
        return 0
    fi

    if $remote; then
        local backup_name="retroarch.cfg.bak.${host}.${timestamp}"
        scp "${user}@${host}:${target_cfg}" "./${backup_name}"
        echo "Backed up remote config to ${PWD}/${backup_name}"
    else
        local backup_name="retroarch.cfg.bak.local.${timestamp}"
        cp "${target_cfg}" "./${backup_name}"
        echo "Backed up local config to ${PWD}/${backup_name}"
    fi
}
