-- https://github.com/mikavilpas/yazi.nvim

---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>fi",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Yazi: Open at current file",
    },
    {
      "<leader>fd",
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi: Open at working dir",
    },
    {
      "<leader>fw",
      "<cmd>Yazi toggle<cr>",
      desc = "Yazi: Resume last session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },

    yazi_floating_window_winblend = 20,
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
