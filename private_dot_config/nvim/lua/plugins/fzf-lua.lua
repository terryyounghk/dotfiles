-- https://github.com/ibhagwan/fzf-lua

-- My current preference on pickers: fzf-lua > telescope > snacks.picker
-- vim.g.lazyvim_picker = "fzf"

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    -- https://github.com/ibhagwan/fzf-lua/wiki#how-do-i-setup-input-history-keybinds
    fzf_opts = {
      ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
    },
    winopts = {
      width = 0.9,
      height = 0.9,
      fullscreen = false,
      backdrop = 20,
      border = "rounded",

      preview = {
        vertical = "down:70%",
        layout = "vertical",
        scrollchars = { "┃", "" },
        border = "rounded",
      },
      oldfiles = {
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- avoid Treesitter parsing large files by telling previewer
          -- not to add syntax highlighting to files larger than this size
          syntax_limit_b = 1024 * 100, -- 100kb
        }
      },
    },
  },
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep_resume<cr>", desc = "Grep" },

    -- find
    { "<leader>fa", "<cmd>FzfLua tabs<cr>", desc = "Tabs" },
    { "<leader>fz", "<cmd>FzfLua<cr>", desc = "FzfLua" },

    -- git
    { "<leader>gn", "<cmd>FzfLua git_hunks<cr>", desc = "Git Diff (Hunks)" },

    -- git (override snacks keymaps)
    { "<leader>gb", "<cmd>FzfLua git_blame<cr>", desc = "Git Blame" },
    { "<leader>gf", "<cmd>FzfLua git_bcommits<cr>", desc = "Git Current File History" },
    { "<leader>gl", "<cmd>FzfLua git_commits<cr>", desc = "Git Log" },
    { "<leader>gL", false },
    { "<leader>gY", false },

    -- search
    -- TODO: implement <leader>su Undotree, port from snacks, with proper tree visuals
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undotree" },
  },
}
