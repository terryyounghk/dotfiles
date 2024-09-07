-- multiple chezmoi-related plugins here

return {
  {
    -- https://github.com/alker0/chezmoi.vim
    -- syntax highlighting support when editing chezmoi managed files
    "alker0/chezmoi.vim",
    enabled = true,
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
      -- add other options here if needed.
    end,
  },
  {
    -- https://github.com/xvzc/chezmoi.nvim
    -- edit chezmoi-managed files and automatically apply
    "xvzc/chezmoi.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chezmoi").setup({
        edit = {
          watch = false,
          force = false,
        },
        notification = {
          on_open = true,
          on_apply = true,
          on_watch = false,
        },
        telescope = {
          select = { "<CR>" },
        },
      })

      -- TODO: this isn't working, shows warning when neo-tree shows then neovim starts
      -- -- treat all files in chezmoi source directory as chezmoi files
      -- --  e.g. ~/.local/share/chezmoi/*
      -- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      --     pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
      --     callback = function(ev)
      --         local bufnr = ev.buf
      --         local edit_watch = function()
      --             require("chezmoi.commands.__edit").watch(bufnr)
      --         end
      --         vim.schedule(edit_watch)
      --     end,
      -- })

      -- Add telescope integration
      -- https://github.com/xvzc/chezmoi.nvim?tab=readme-ov-file#telescope-integration
      -- TODO: User Command: https://github.com/xvzc/chezmoi.nvim?tab=readme-ov-file#user-command

      local telescope = require("telescope")

      telescope.load_extension("chezmoi")

      vim.keymap.set("n", "<leader>z", telescope.extensions.chezmoi.find_files, { desc = "Find Chezmoi Files" })
    end,
  },
}
