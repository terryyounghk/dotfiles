-- https://github.com/uga-rosa/ccc.nvim

-- enable true color
vim.opt.termguicolors = true

return {
  "uga-rosa/ccc.nvim",
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}
