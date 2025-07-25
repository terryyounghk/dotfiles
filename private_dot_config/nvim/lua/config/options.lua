-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

----------------------------------------------------------------------
local g = vim.g

g.maplocalleader = ","
g.autoformat = false

-- seems neovim keeps switching Root Dir for some reason.
-- This seems to resolve it.
-- Ref: https://github.com/LazyVim/LazyVim/discussions/2150
g.root_spec = { "cwd" }

-- **lazygit** now automatically uses the colors of your current colorscheme.
-- This is enabled by default. To disable, add the below to your `options.lua`:
-- https://github.com/LazyVim/LazyVim/commit/7d0dbc6dedc2d6cb4c3bc77fa296dc07ce5927c9
-- https://github.com/LazyVim/LazyVim/discussions/4251#discussioncomment-10231819
g.lazygit_config = false

-- Default "auto"
-- If use "snacks": https://www.lazyvim.org/extras/editor/snacks_picker#options
-- Currently prefer "fzf"
g.lazyvim_picker = "fzf"

-- switch animations off, as it occassionally interferes with replaying macros across pages
g.snacks_animate = false

----------------------------------------------------------------------
-- Reference: https://neovim.io/doc/user/options.html

local o = vim.o

o.showmode = true

-- cursor settings
o.cursorline = true
o.cursorlineopt = "both"
o.cursorcolumn = true

o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- tab settings
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

-- never show the tabline
o.showtabline = 0
o.laststatus = 0

-- don't hide stuff in code, e.g. hiding double-quotes in json files
o.conceallevel = 0

-- session
o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize,localoptions"
