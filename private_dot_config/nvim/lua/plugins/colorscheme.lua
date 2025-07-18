local colors = require("config.custom_colors")

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
        darker_contrast = true, -- More contrast for darker style
        daylight_switch = false, -- Enable day and night style switching
        deep_black = true, -- Enable a deeper black background
      },

      -- custom_colors = {
      --   variable = "#",
      -- },

      custom_highlights = {
        -- explicitly transparent backgrounds
        Normal = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        -- TelescopeNormal = { bg = "NONE" },
        -- TelescopePromptBorder = { bg = "NONE" },
        -- TelescopePreviewBorder = { bg = "NONE" },
        -- TelescopeResultsBorder = { bg = "NONE" },
        -- WhichKey = { bg = "NONE" },
        -- WhichKeyFloat = { bg = "NONE" },

        -- override certain elements
        -- LineNr = { fg = colors.fg.normal },
        -- CursorLine = { bg = colors.bg.light },
        -- CursorColumn = { bg = colors.bg.light },
        Comment = { fg = colors.fg.dark },
        GitSignsCurrentLineBlame = { fg = colors.fg.magenta },

        LineNrAbove = { fg = colors.fg.red },
        LineNrBelow = { fg = colors.fg.green },
        CursorLineNr = { fg = colors.fg.black, bg = colors.fg.yellow },
        -- DashboardHeader = { fg = colors.fg.yellow },
        -- SnacksDashboardHeader = { fg = colors.fg.yellow },
        -- SnacksNormal = { bg = colors.bg.none },
        -- SnacksDashboardNormal = { bg = colors.bg.none },
        WhichKey = { fg = colors.fg.red, gui = "bold", cterm = "bold" },
        WhichKeyDesc = { fg = colors.fg.yellow },
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
