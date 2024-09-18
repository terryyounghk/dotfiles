-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local telescope = require("telescope")
telescope.load_extension("chezmoi")

map({"n", "v"}, "<leader>sA", ":%s/", { desc = "Regex Search in File" })

map("n", "<leader>ll", ":Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<CR>", { desc = "LazyVim Extras" })
map("n", "<leader>lf", ":LazyFormat<CR>", { desc = "LazyVim Format" })
map("n", "<leader>lh", ":LazyHealth<CR>", { desc = "LazyVim Healthchecks" })
map("n", "<leader>li", ":LazyFormatInfo<CR>", { desc = "LazyVim Format Info" })

map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Telescope Old Files" })
map("n", "<leader>fz", telescope.extensions.chezmoi.find_files, { desc = "Find Chezmoi File" })

map("n", "<leader>ux", ":TransparentToggle<CR>", { desc = "Toggle Transparency" })

map("n", "<leader>t", "", { desc = "Tools" })
map("n", "<leader>tc", ":Cheatsheet<CR>", { desc = "Cheatsheet" })
