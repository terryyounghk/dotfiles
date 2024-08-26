return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add colorscheme
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}

