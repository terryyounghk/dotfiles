-- if true then return {} end

-- https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
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
    },
    init = function()
      -- override to keep NeoTree hidden
    end,
  },
}
