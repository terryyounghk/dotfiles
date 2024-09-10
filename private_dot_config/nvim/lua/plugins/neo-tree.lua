-- https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function()
      -- override to keep NeoTree hidden
    end,
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        window = {
          position = "float",
        },
        filesystem = {
          filtered_items = {
            visible = true,
            force_visible_in_empty_folder = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              ".github",
              "node_modules",
              "package-lock.json",
            },
            always_show = {
              ".wip",
              ".gitignore",
              "package-lock.json",
              "yarn.lock",
            },
            always_show_by_pattern = {
              ".wip*",
              ".env*",
              "*.lock",
            },
            never_show = {
              ".git",
              ".DS_Store",
              "thumbs.db",
            },
            never_show_by_pattern = {},
          },
        },
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
      })

      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#242424" })
      vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = "#242424" })
      vim.api.nvim_set_hl(0, "NeoTreeFileStats", { fg = "#6b9b9b" })
      vim.api.nvim_set_hl(0, "NeoTreeFileStatsHeader", { fg = "#6b9b9b" })
      vim.api.nvim_set_hl(0, "NeoTreeDotFile", { fg = "#7472b0" })
    end,
  },
}
