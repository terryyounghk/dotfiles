-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Make all backgrounds transparent
vim.api.nvim_create_augroup("nobg", { clear = true })
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  desc = "Make all backgrounds transparent",
  group = "nobg",
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
  end,
})
