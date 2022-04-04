wallpaper=$HOME/wallpapers/wfu/

if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]
then
  neofetch --off --color_blocks off | lolcat
  fortune | cowsay -W 50 | lolcat
else
  neofetch --iterm2 "$wallpaper" --size 300px --crop_mode fit --color_blocks off
  fortune | cowsay -W 80 | lolcat
fi
