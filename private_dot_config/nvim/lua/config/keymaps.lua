-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local telescope = require("telescope")
telescope.load_extension("chezmoi")

map("n", "<leader>uv", ":Telescope vim_options<CR>", { desc = "Vim Options" })

map({"n", "v"}, "<leader>sA", ":%s/", { desc = "Regex Search in File" })

map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<CR>", { desc = "LazyVim Extras" })
map("n", "<leader>lf", ":LazyFormat<CR>", { desc = "LazyVim Format" })
map("n", "<leader>lh", ":LazyHealth<CR>", { desc = "LazyVim Healthchecks" })
map("n", "<leader>li", ":LazyFormatInfo<CR>", { desc = "LazyVim Format Info" })

map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Telescope Old Files" })
map("n", "<leader>fz", telescope.extensions.chezmoi.find_files, { desc = "Find Chezmoi File" })

map("n", "<leader>t", "", { desc = "Tools" })
map("n", "<leader>tc", ":CccPick<CR>", { desc = "Color Picker" })
map("n", "<leader>te", ":Telescope<CR>", { desc = "Telescope" })
map("n", "<leader>tt", ":CccConvert<CR>", { desc = "Convert Color" })
map("n", "<leader>tC", ":Cheatsheet<CR>", { desc = "Cheatsheet" })

-- Copy the current buffer path to the clipboard
-- https://stackoverflow.com/a/17096082/1336788
map("n", "<leader>fy", "", { desc = "Copy" })
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
