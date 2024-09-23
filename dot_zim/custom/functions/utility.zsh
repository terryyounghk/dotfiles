# ----------------------------------------------
# some general purpose utility functions
# ----------------------------------------------

# print a 256-color table
print_colors () {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%24)):#15}:+$'\n'}; done
}

