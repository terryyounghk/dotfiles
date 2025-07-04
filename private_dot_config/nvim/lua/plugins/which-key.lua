-- https://github.com/folke/which-key.nvim

-- This config adds `loop` to the mappings I need to be in "Hydra Mode"
-- https://github.com/folke/which-key.nvim/discussions/765

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
      local wk = require("which-key")

      -- https://github.com/folke/which-key.nvim/blob/370ec46f710e058c9c1646273e6b225acf47cbed/lua/which-key/presets.lua#L4-L17
      -- Copied "helix" preset but changed:
      --   - win.width.max to something high like 200
      --   - layout.width.min to 100
      wk.setup({
        win = {
          width = { min = 30, max = 200 },
          height = { min = 4, max = 0.75 },
          padding = { 0, 1 },
          col = -1,
          row = -1,
          border = "rounded",
          title = true,
          title_pos = "left",
        },
        layout = {
          width = {
            min = 100,
          },
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
