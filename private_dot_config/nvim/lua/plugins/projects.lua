-- https://github.com/ahmedkhalf/project.nvim

return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      -- stumbled upon this solution to set Telescope size for specific pickers
      -- https://github.com/rmagatti/auto-session/issues/356
      -- theme_conf = {
      layout_config = {
        width = 0.4,
        height = 0.4,
      },
      -- },
      patterns = {
        ".git",
        "package.json",
        ".tool-versions",
      },
    },
  },
}
