if true then return {} end

local map = vim.keymap.set

return {
  {
    'numToStr/FTerm.nvim',
    name = 'FTerm.Btop.nvim',
    config = function()
      local fterm = require('FTerm')
      local btop = fterm:new({
        ft = 'fterm_btop',
        cmd = 'btop',
        dimensions = {
          x = 0.5,
          y = 0.5,
          height = 0.9,
          width = 0.9,
        },
        border = 'double',
        hl = 'Normal',
        blend = 10,
        clear_env = false,
        env = nil,
        on_exit = nil,
        on_stderr = nil,
        on_stdout = nil,
        auto_close = true,
      })
      map('n', '<leader>lb', function() btop:toggle() end, {desc = 'Toggle btop'})
      map('t', '<leader>lb', function() btop:toggle() end, {desc = 'Toggle btop'})
    end,
  },
}

