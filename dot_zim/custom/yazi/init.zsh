# yazi: https://github.com/sxyazi/yazi

export EDITOR=nvim

alias ypa='ya pkg add'
alias ypd='ya pkg delete'
alias ypi='ya pkg install'
alias ypu='ya pkg upgrade'
alias ypl='ya pkg list'
alias ypr='chezmoi re-add ~/.config/yazi/package.toml'

# -----------------------------------------------------------------------------------

# https://github.com/Sonico98/yazi-prompt.sh
# 005 is the segment color. If you want to change it, you can run this in a terminal to see all available colors:
# for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
function prompt_yazi() {
	if [ -n "$YAZI_LEVEL" ]; then
		p10k segment -f 005 -i '' -t 'Yazi terminal'
	fi
}

# https://yazi-rs.github.io/docs/quick-start/
# y: start
# q: quit and CWD
# Q: quit without CWD
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
