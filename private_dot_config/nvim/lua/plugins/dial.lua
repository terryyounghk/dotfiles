-- https://github.com/monaqa/dial.nvim

-- TODO:
-- https://github.com/monaqa/dial.nvim/issues/106

return {
  "monaqa/dial.nvim",
  opts = function(_, opts)
    local augend = require("dial.augend")

    -- Common augends for all filetypes
    local default_augends = {
      -- Date format
      augend.date.alias["%Y/%m/%d"],

      -- Decimal integers
      augend.integer.alias.decimal,

      -- Hexadecimal integers
      augend.integer.alias.hex,

      -- :h dial-augends-mic
      augend.misc.alias.markdown_header,
    }
    -- Extend default group with common augends
    opts.groups.default = vim.list_extend(opts.groups.default, default_augends)
  end,
}
