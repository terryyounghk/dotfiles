-- Keymaps are automatically loaded on the VeryLazy event
--
-- Default keymaps that are always set:
--   https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Add any additional keymaps here

local map = vim.keymap.set

-- local telescope = require("telescope")
-- telescope.load_extension("chezmoi")

-- Function to toggle cursorline
local function toggle_cursorline()
  vim.o.cursorline = not vim.o.cursorline
  print("Cursorline: " .. (vim.o.cursorline and "ON" or "OFF"))
end

-- Function to toggle cursorcolumn
local function toggle_cursorcolumn()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
  print("Cursorcolumn: " .. (vim.o.cursorcolumn and "ON" or "OFF"))
end

-- Function to toggle both cursorline and cursorcolumn
local function toggle_cursor_highlight()
  if not vim.o.cursorline or not vim.o.cursorcolumn then
    vim.o.cursorline = true
    vim.o.cursorcolumn = true
  else
    vim.o.cursorline = false
    vim.o.cursorcolumn = false
  end
  print("Cursorline: " .. (vim.o.cursorline and "ON" or "OFF") .. ", Cursorcolumn: " .. (vim.o.cursorcolumn and "ON" or "OFF"))
end

-- ==============================================================
-- A
map("n", "<leader>a", "", { desc = "AI" })

-- ==============================================================
-- B
map("n", "<leader>b", "", { desc = "Buffers" })

-- ==============================================================
-- C
map("n", "<leader>c", "", { desc = "Code" })

-- ==============================================================
-- D
map("n", "<leader>d", "", { desc = "Profiler" })
map("n", "<leader>dp", "", { desc = "Profiler" })

-- ==============================================================
-- F
map("n", "<leader>f", "", { desc = "Find" })
-- Copy the current buffer path to the clipboard
-- https://stackoverflow.com/a/17096082/1336788
map("n", "<leader>fy", "", { desc = "Copy" })
-- map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Telescope Old Files" })
-- map("n", "<leader>fz", telescope.extensions.chezmoi.find_files, { desc = "Find Chezmoi File" })
map("n", "<leader>fyr", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy relative path to clipboard" })

-- full path
map("n", "<leader>fyp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy full path to clipboard" })

-- just filename
map("n", "<leader>fyf", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "Copy filename to clipboard" })

-- directory of the current file
map("n", "<leader>fyd", function()
  vim.fn.setreg("+", vim.fn.expand("%:h"))
end, { desc = "Copy directory to clipboard" })

-- ==============================================================
-- G
map("n", "<leader>g", "", { desc = "Git" })

-- ==============================================================
-- L
map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<CR>", { desc = "LazyVim Extras" })
map("n", "<leader>lf", ":LazyFormat<CR>", { desc = "LazyVim Format" })
map("n", "<leader>lh", ":LazyHealth<CR>", { desc = "LazyVim Healthchecks" })
map("n", "<leader>li", ":LazyFormatInfo<CR>", { desc = "LazyVim Format Info" })

-- ==============================================================
-- M
map("n", "<leader>m", "", { desc = "Markdown" })

-- ==============================================================
-- N
map("n", "<leader>n", "", { desc = "NodeJs" })

-- ==============================================================
-- Q
map("n", "Q", "@@", { desc = "Repeat Macro" })
map("n", "<C-q>", "n@@", { desc = "Find Next and Repeat Macro" })
map("n", "<leader>q", "", { desc = "Session" })

-- ==============================================================
-- R
map("n", "<leader>r", "", { desc = "Refactor" })

-- ==============================================================
-- S
map("n", "<leader>s", "", { desc = "Search" })
map({"n", "v"}, "<leader>sA", ":%s/", { desc = "Regex Search in File" })

-- ==============================================================
-- T
map("n", "<leader>t", "", { desc = "Tools" })
map("n", "<leader>tc", ":CccPick<CR>", { desc = "Color Picker" })
-- map("n", "<leader>te", ":Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tt", ":CccConvert<CR>", { desc = "Convert Color" })
map("n", "<leader>tC", ":Cheatsheet<CR>", { desc = "Cheatsheet" })

-- ==============================================================
-- U
map("n", "<leader>u", "", { desc = "UI" })
map('n', '<leader>uk', "", { desc = "Toggle Cursor Options" })
map('n', '<leader>ukl', toggle_cursorline, { desc = "Toggle Cursorline" })
map('n', '<leader>ukk', toggle_cursorcolumn, { desc = "Toggle Cursorcolumn" })
map('n', '<leader>ukh', toggle_cursor_highlight, { desc = "Toggle Cursorline and Cursorcolumn" })
map("n", "<leader>uv", ":FzfLua nvim_options<CR>", { desc = "NeoVim Options" })
map("n", "<leader>uH", require("config.focus_highlight").toggle, { desc = "Toggle Focus Highlighting" })

-- ==============================================================
-- W
map("n", "<leader>w", "", { desc = "Window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close all other window" })
map("n", "<leader>w<space>",
  function ()
    require("which-key").show({
      keys = "<c-w>",
      loop = true,
    })
  end,
{ desc = "Window (Hydra Mode)" })

-- ==============================================================
-- X
map("n", "<leader>x", "", { desc = "Dev" })

-- ==============================================================
-- Tab
map("n", "<leader><tab>", "", { desc = "Tabs" })
