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
        preset = "modern",
      })

      wk.add({
        {"[", function () wk.show({ keys = "[", loop = true}) end },
        {"]", function () wk.show({ keys = "]", loop = true}) end },
      })
    end,
  }
}
