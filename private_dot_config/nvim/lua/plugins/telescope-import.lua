-- https://github.com/piersolenski/telescope-import.nvim

return {
  {
    "piersolenski/telescope-import.nvim",
    enabled = false,
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("import")

      local map = vim.keymap.set

      map('n', '<leader>ci', ':Telescope import<CR>', { desc = 'Import Modules'})
    end,
  },
}
