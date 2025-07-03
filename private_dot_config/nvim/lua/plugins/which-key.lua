-- https://github.com/folke/which-key.nvim

-- This config adds `loop` to the mappings I need to be in "Hydra Mode"
-- https://github.com/folke/which-key.nvim/discussions/765

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
      local wk = require("which-key")

      wk.setup({
        preset = false,
        win = {
          no_overlap = true,
          title = true,
          title_pos = "left",
          border = "rounded",
          col = math.huge,
          row = math.huge,
        },
        layout = {
          width = {
            min = 100,
          },
          spacing = 10,
        },
      })

      wk.add({
        -- This puts the [ ] keys in Hydra Mode
        -- This is useful for continuously jumping through hunks, for example.
        {"<leader>[", function () wk.show({ keys = "[", loop = true}) end },
        {"<leader>]", function () wk.show({ keys = "]", loop = true}) end },
      })
    end,
  }
}
