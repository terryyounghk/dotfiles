if true then return {} end

local map = vim.keymap.set
local fterm = require('FTerm')

return {
  {
    'numToStr/FTerm.nvim',
    name = 'FTerm.LazyGit.nvim',
    config = function()
      local lazygit = fterm:new({
        ft = 'fterm_lazygit',
        cmd = 'lazygit',
        dimensions = {
          x = 0.5,
          y = 0.5,
          height = 0.9,
          width = 0.9,
        },
        border = 'double',
        hl = 'Normal',
        blend = 20,
        clear_env = false,
        env = nil,
        on_exit = nil,
        on_stderr = nil,
        on_stdout = nil,
        auto_close = true,
      })
      map('n', '<leader>lg', function() lazygit:toggle() end, {desc = 'Toggle Lazy[G]it'})
      map('t', '<leader>lg', function() lazygit:toggle() end, {desc = 'Toggle Lazy[G]it'})
    end,
  },
}

