-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

----------------------------------------------------------------------
local g = vim.g

g.autoformat = false

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

