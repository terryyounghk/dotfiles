-- https://github.com/olimorris/persisted.nvim

-- TODO: add keymaps for persisted.nvim
-- see https://github.com/olimorris/persisted.nvim?tab=readme-ov-file#rocket-usage

return {
  -- Lua
  {
    "olimorris/persisted.nvim",
    enabled = true,
    lazy = true, -- make sure the plugin is always loaded at startup
    -- config = true,
    opts = {
      autostart = true, -- Automatically start the plugin on load?

      -- Function to determine if a session should be saved
      ---@type fun(): boolean
      should_save = function()
        return true
      end,

      save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Directory where session files are saved

      follow_cwd = true, -- Change the session file to match any change in the cwd?
      use_git_branch = true, -- Include the git branch in the session file name?
      autoload = true, -- Automatically load the session for the cwd on Neovim startup?

      -- Function to run when `autoload = true` but there is no session to load
      ---@type fun(): any
      on_autoload_no_session = function() end,

      -- Table of dirs that the plugin will start and autoload from
      allowed_dirs = {
        "~/.config/nvim/",
        "~/.local/share/chezmoi/",
        "~/wd/",
      },
      ignored_dirs = {}, -- Table of dirs that are ignored for starting and autoloading

      telescope = {
        mappings = { -- Mappings for managing sessions in Telescope
          copy_session = "<C-c>",
          change_branch = "<C-b>",
          delete_session = "<C-d>",
        },
        icons = { -- icons displayed in the Telescope picker
          selected = " ",
          dir = "  ",
          branch = " ",
        },
      },
    },
  },
}
