-- https://github.com/mcauley-penney/tidy.nvim

return {
  {
    "mcauley-penney/tidy.nvim",
    enabled = true,
    opts = {
      enabled_on_save = true,
      filetype_exclude = { "markdown", "diff" },
    },
    init = function()
      vim.keymap.set("n", "<leader>ct", require("tidy").toggle, { desc = "Toggle Trim Trailing Spaces on Save" })
      vim.keymap.set("n", "<leader>cp", require("tidy").run, { desc = "Trim Trailing Spaces" })
    end,
  },
}
