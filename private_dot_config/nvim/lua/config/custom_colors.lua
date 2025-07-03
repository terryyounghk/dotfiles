local colors =  {
  fg = {
    black = "#000000",
    white = "#ffffff",

    light = "#eeeeee",
    normal = "#bcbcbc",
    dark = "#949494",

    red = "#ff5faf",
    orange = "#ffaf00",
    yellow = "#ffd700",
    green = "#5fff01",
    blue = "#5fffff",
    violet = "#af87ff",
    magenta = "#d75fff",
  },
  bg = {
    none = "NONE",

    black = "#000000",
    white = "#ffffff",

    light = "#767676",
    normal = "#4e4e4e",
    dark = "#1c1c1c",

    red = "#5f0000",
    orange = "#af5f00",
    yellow = "#5f5f00",
    green = "#005f00",
    blue = "#005fd7",
    violet = "#5f00ff",
    magenta = "#5f0087",
  },
}

-- References:
-- :h modes()
-- :h vim-modes
-- https://github.com/nvim-lualine/lualine.nvim/blob/b431d228b7bbcdaea818bdc3e25b8cdbe861f056/lua/lualine/utils/mode.lua#L4
colors.modes = {
  ["NORMAL"] = colors.bg.none,
  ["VISUAL"] = colors.bg.blue,
  ["V-LINE"] = colors.bg.blue,
  ["V-BLOCK"] = colors.bg.blue,
  ["SELECT"] = colors.bg.orange,
  ["S-LINE"] = colors.bg.orange,
  ["S-BLOCK"] = colors.bg.orange,
  ["INSERT"] = colors.bg.green,
  ["REPLACE"] = colors.bg.violet,
  ["V-REPLACE"] = colors.bg.violet,
  ["COMMAND"] = colors.bg.red,
  ["EX"] = colors.bg.red,
  ["MORE"] = colors.bg.magenta,
  ["CONFIRM"] = colors.bg.magenta,
  ["SHELL"] = colors.bg.red,
  ["TERMINAL"] = colors.bg.red,
  ["MACRO"] = colors.bg.yellow, -- This is not a mode, but we use it for macro recording
}

return colors
