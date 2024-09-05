return {
  {
    'echasnovski/mini.diff',
    version = false,
    event = 'VeryLazy',
    config = function ()
      -- ###################################################################
      require('mini.diff').setup()
      vim.api.nvim_set_hl(0, 'MiniDiffOverAdd', { bg = "#104a18" }) -- bg: dark green
      vim.api.nvim_set_hl(0, 'MiniDiffOverDelete', { bg = "#4a1028" }) -- bg: dark red
      vim.api.nvim_set_hl(0, 'MiniDiffOverChange', { bg = "#6b4e04" }) -- bg: dark brown
      vim.api.nvim_set_hl(0, 'MiniDiffOverContext', { fg = "#414747" }) -- fg: grey
    end,
  },
}

