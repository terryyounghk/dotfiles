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

