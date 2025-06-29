-- https://github.com/hedyhli/outline.nvim

return {
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>cs", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup({
        outline_window = {
          show_numbers = true,
          show_relative_numbers = true,
        },
        outline_items = {
          show_symbol_lineno = true,
        },
        preview_wincow = {
          auto_preview = true,
          open_hover_on_preview = true,
          live = true,
        },
        keymaps = {
          hover_symbol = 'y', -- override default: C-space
          toggle_preview = 'p',
        }
      })
    end,
  },
}
