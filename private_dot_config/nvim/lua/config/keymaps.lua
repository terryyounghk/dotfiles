-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local keys = {}
local telescope = require("telescope")
telescope.load_extension("chezmoi")

-- Telescope things frequently accessed
map("n", "<leader>ke", ":LazyExtras<CR>", { desc = "LazyVim Extras" })

keys = { "<leader>kq", "<leader>wq" }
for i = 1, #keys do
  map("n", keys[i], ":wall<CR>:qall<CR>", { desc = "Save Files/Session and Quit" })
end

keys = { "<leader>ko", "<leader>so" }
for i = 1, #keys do
  map("n", keys[i], ":Telescope oldfiles<CR>", { desc = "Telescope Old Files" })
end

keys = { "<leader>z", "<leader>fz" }
for i = 1, #keys do
  map("n", keys[i], telescope.extensions.chezmoi.find_files, { desc = "Find Chezmoi File" })
end

map("n", "<leader>kt", ":TransparentToggle<CR>", { desc = "Toggle Transparency" })

keys = { "<leader>kc", "<leader>se" }
for i = 1, #keys do
  map("n", keys[i], ":Cheatsheet<CR>", { desc = "Cheatsheet" })
end
