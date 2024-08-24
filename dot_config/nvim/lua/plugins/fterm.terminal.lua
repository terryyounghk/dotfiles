if true then return {} end

local map = vim.keymap.set

return {
  {
    'numToStr/FTerm.nvim',
    config = function ()
      local fterm = require('FTerm')
      map('n', '<leader>lt', function() fterm:toggle() end, {desc = 'Toggle Terminal'})
      map('t', '<leader>lt', function() fterm:toggle() end, {desc = 'Toggle Terminal'})
      -- map("n", "<C-g>", fterm.toggle)
      -- map("t", "<C-g>", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>")
    end,
  },
}

