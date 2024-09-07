-- if true then return {} end

-- https://github.com/nvim-neo-tree/neo-tree.nvim#quickstart
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
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
          never_show_by_pattern = {

          },
          -- follow_current_file = {
            -- enabled = true,
          -- },
          -- leave_dirs_open = true,
        },
        -- buffers = {
          -- follow_current_file = {
            -- enabled = true,
          -- },
          -- leave_dirs_open = true,
        -- },
      },
    },
    init = function (
      -- do nothing, keep NeoTree hidden
    )
    end
  },
}

