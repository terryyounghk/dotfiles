-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

----------------------------------------------------------------------
local g = vim.g

g.autoformat = false

-- seems neovim keeps switching Root Dir for some reason.
-- This seems to resolve it.
-- Ref: https://github.com/LazyVim/LazyVim/discussions/2150
g.root_spec = { "cwd" }

----------------------------------------------------------------------
local o = vim.o

-- cursor settings
o.cursorline = true
o.cursorlineopt = 'number'

-- tab settings
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

