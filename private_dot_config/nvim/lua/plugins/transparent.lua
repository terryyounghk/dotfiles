return {
  {
    "xiyaowong/transparent.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("transparent").setup({
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
        extra_groups = {
          "TelescopeNormal",
          "NormalFloat",
        },
        exclude_groups = {
          "NeoTreeNormal",
          "NeoTreeFloatNormal",
          "NeoTreeFloatBorder",
          "NeoTreeFloatTitle",
        },

        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
        -- keys = {
        --   { "<leader>kt", mode = { "n" }, ":TransparentToggle<CR>", desc = "Toggle Transparency" },
        -- },
      })

      require("transparent").clear_prefix("BufferLine")
    end,
  },
}
