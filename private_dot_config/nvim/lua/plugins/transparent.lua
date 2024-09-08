return {
  {
    "xiyaowong/transparent.nvim",
    enabled = true,
    lazy = false,
    config = function()
      -- Optional, you don't have to run setup.
      require("transparent").setup({
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          -- "CursorLine",
          -- "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        -- table: additional groups that should be cleared
        extra_groups = {
          -- "NvimTreeNormal", -- NvimTree
          -- "NvimTreeNormalNC",
          -- "NvimTreeNormalFloat",
          -- "NvimTreeEndOfBuffer",
        },
        -- table: groups you don't want to clear
        exclude_groups = {
          -- "NeoTree",
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        },

        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
        -- keys = {
        --   { "<leader>kt", mode = { "n" }, ":TransparentToggle<CR>", desc = "Toggle Transparency" },
        -- },
      })

      require("transparent").clear_prefix("BufferLine")
      -- require("transparent").clear_prefix("NeoTree")
      require("transparent").clear_prefix("Telescope")
      require("transparent").clear_prefix("Normal") -- TODO: might be a bit aggressive here
      -- require("transparent").clear_prefix("lualine")
    end,
  },
}
