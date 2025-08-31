bindkey -e # emacs
# bindkey -v # vim

# Set cursor style (DECSCUSR), VT520.
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

function zle-keymap-select {
  if [[ $KEYMAP = vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
  echo -ne "\e[5 q"
}

zle -N zle-line-init
