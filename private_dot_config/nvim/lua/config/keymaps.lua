-- Keymaps are automatically loaded on the VeryLazy event
--
-- Default keymaps that are always set:
--   https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Add any additional keymaps here

local map = vim.keymap.set

-- ==============================================================
-- Symbols


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
-- K
map("n", "<leader>k", "", { desc = "Faker" })
map("n", "<leader>ka", ":Faker color rgb format:css includeAlpha:true<CR>", { desc = "Color RGBA" })
map("n", "<leader>kb", ":Faker finance bitcoinAddress network:mainnet type:bech32<CR>", { desc = "BTC Address" })
map("n", "<leader>kc", ":Faker color rgb casing:upper format:hex<CR>", { desc = "Color Hex" })
map("n", "<leader>kd", ":Faker date past format:'%Y-%m-%d'<CR>", { desc = "Date (Past)" })
map("n", "<leader>ke", ":Faker finance ethereumAddress<CR>", { desc = "ETH Address" })
map("n", "<leader>kg", ":Faker lorem paragraphs paragraphCount:5<CR>", { desc = "Paragraphs" })
map("n", "<leader>kl", ":Faker finance litecoinAddress<CR>", { desc = "LTC Address" })
map("n", "<leader>kn", ":Faker color rgb human<CR>", { desc = "Color Name" })
map("n", "<leader>km", ":Faker color rgb format:decimal<CR>", { desc = "Color" })
map("n", "<leader>kp", ":Faker password memorable:false length:20", { desc = "Password" })
map("n", "<leader>kr", ":Faker color rgb format:css<CR>", { desc = "Color RGB" })
map("n", "<leader>ks", ":Faker slug wordCount:3", { desc = "Color RGB" })
map("n", "<leader>ku", ":Faker string uuid<CR>", { desc = "UUID" })
map("n", "<leader>kx", ":Faker string hexadecimal length:10", { desc = "Hex" })

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

map("n", "<leader>M", "", { desc = "Macros" })
map("n", "<leader>Me", function()
  local reg = vim.fn.input("Edit which macro? ")
  if reg == "" then return end
  local content = vim.fn.getreg(reg)
  local new_content = vim.fn.input("Edit macro: ", content)
  vim.fn.setreg(reg, new_content)
  print("Macro '"..reg.."' updated")
end, { desc = "Edit macro" })

map("n", "<leader>Mb", function()
  local reg = vim.fn.input("Edit which macro? ")
  if reg == "" then return end

  -- Create scratch buffer with macro content
  vim.cmd("new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(vim.fn.getreg(reg), "\n", true))

  -- Set up save mapping
  vim.keymap.set("n", "w", function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    vim.fn.setreg(reg, table.concat(lines, "\n"))
    vim.cmd("bwipeout!")
    print("Macro '"..reg.."' updated")
  end, { buffer = true, desc = "Save macro" })

  print("Editing macro '"..reg.."' - Press 'w' to save")
end, { desc = "Edit macro in buffer" })

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
map("n", "<leader>uv", ":FzfLua nvim_options<CR>", { desc = "NeoVim Options" })

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
