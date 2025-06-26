-- TODO: make a way to reuse colors across nvim plugins, tmux, etc
local colors = {
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
    normal = "#272822",
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

return {
  {
    "ray-x/starry.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      border = false, -- Split window borders
      hide_eob = true, -- Hide end of buffer
      italics = {
        comments = false, -- Italic comments
        strings = false, -- Italic strings
        keywords = false, -- Italic keywords
        functions = false, -- Italic functions
        variables = false, -- Italic variables
      },

      contrast = { -- Select which windows get the contrast background
        enable = false, -- Enable contrast
        terminal = false, -- Darker terminal
        filetypes = {}, -- Which filetypes get darker? e.g. *.vim, *.cpp, etc.
      },

      text_contrast = {
        lighter = false, -- Higher contrast text for lighter style
        darker = false, -- Higher contrast text for darker style
      },

      disable = {
        background = true, -- true: transparent background
        term_colors = true, -- Disable setting the terminal colors
        eob_lines = false, -- Make end-of-buffer lines invisible
      },

      style = {
        name = "monokai", -- Theme style name (moonlight, earliestsummer, etc.)
        -- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
        disable = {
          "italic",
        }, -- a list of styles to disable, e.g. {'bold', 'underline'}
        fix = true,
        darker_contrast = false, -- More contrast for darker style
        daylight_swith = false, -- Enable day and night style switching
        deep_black = false, -- Enable a deeper black background
      },

      -- custom_colors = {
      --   variable = "#",
      -- },
      custom_highlights = {
        -- explicitly transparent backgrounds
        Normal = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        TelescopeNormal = { bg = "NONE" },
        TelescopePromptBorder = { bg = "NONE" },
        TelescopePreviewBorder = { bg = "NONE" },
        TelescopeResultsBorder = { bg = "NONE" },
        WhichKey = { bg = "NONE" },
        WhichKeyFloat = { bg = "NONE" },

        -- override certain elements
        LineNr = { fg = colors.fg.normal },
        CursorLine = { bg = colors.bg.light },
        CursorColumn = { bg = colors.bg.light },
        Comment = { fg = colors.fg.dark },
        GitSignsCurrentLineBlame = { fg = colors.fg.light },

        LineNrAbove = { fg = colors.fg.red },
        LineNrBelow = { fg = colors.fg.green },
        CursorLineNr = { fg = colors.fg.black, bg = colors.fg.yellow },
        DashboardHeader = { fg = colors.fg.yellow },
        WhichKeyDesc = { fg = colors.fg.orange },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  },
}
