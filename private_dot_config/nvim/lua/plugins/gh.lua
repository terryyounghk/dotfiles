-- https://github.com/ldelossa/gh.nvim

return {
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    config = function()
      require("litee.gh").setup({
        -- deprecated, around for compatability for now.
        jump_mode = "invoking",
        -- remap the arrow keys to resize any litee.nvim windows.
        map_resize_keys = false,
        -- do not map any keys inside any gh.nvim buffers.
        disable_keymaps = false,
        -- the icon set to use.
        icon_set = "default",
        -- any custom icons to use.
        icon_set_custom = nil,
        -- whether to register the @username and #issue_number omnifunc completion
        -- in buffers which start with .git/
        git_buffer_completion = true,
        -- defines keymaps in gh.nvim buffers.
        keymaps = {
          -- when inside a gh.nvim panel, this key will open a node if it has
          -- any futher functionality. for example, hitting <CR> on a commit node
          -- will open the commit's changed files in a new gh.nvim panel.
          open = "<CR>",
          -- when inside a gh.nvim panel, expand a collapsed node
          expand = "zo",
          -- when inside a gh.nvim panel, collpased and expanded node
          collapse = "zc",
          -- when cursor is over a "#1234" formatted issue or PR, open its details
          -- and comments in a new tab.
          goto_issue = "gd",
          -- show any details about a node, typically, this reveals commit messages
          -- and submitted review bodys.
          details = "d",
          -- inside a convo buffer, submit a comment
          submit_comment = "<C-s>",
          -- inside a convo buffer, when your cursor is ontop of a comment, open
          -- up a set of actions that can be performed.
          actions = "<C-a>",
          -- inside a thread convo buffer, resolve the thread.
          resolve_thread = "<C-r>",
          -- inside a gh.nvim panel, if possible, open the node's web URL in your
          -- browser. useful particularily for digging into external failed CI
          -- checks.
          goto_web = "gx",
        },
      })

      local map = vim.keymap.set

      map("n", "<leader>gh", "", { desc = "Github" })

      map("n", "<leader>ghc", "", { desc = "Commits" })
      map("n", "<leader>ghcc", "<cmd>GHCloseCommit<cr>", { desc = "Close" })
      map("n", "<leader>ghce", "<cmd>GHExpandCommit<cr>", { desc = "Expand" })
      map("n", "<leader>ghco", "<cmd>GHOpenToCommit<cr>", { desc = "Open To" })
      map("n", "<leader>ghcp", "<cmd>GHPopOutCommit<cr>", { desc = "Pop Out" })
      map("n", "<leader>ghcz", "<cmd>GHCollapseCommit<cr>", { desc = "Collapse" })

      map("n", "<leader>ghi", "<cmd>GHPreviewIssues<cr>", { desc = "Issues (Preview)" })
      map("n", "<leader>ghp", "<cmd>LTPanel<cr>", { desc = "Toggle Panel" })

      map("n", "<leader>ghr", "", { desc = "Review" })
      map("n", "<leader>ghrb", "<cmd>GHStartReview<cr>", { desc = "Begin" })
      map("n", "<leader>ghrc", "<cmd>GHCloseReview<cr>", { desc = "Close" })
      map("n", "<leader>ghrd", "<cmd>GHDeleteReview<cr>", { desc = "Delete" })
      map("n", "<leader>ghre", "<cmd>GHExpandReview<cr>", { desc = "Expand" })
      map("n", "<leader>ghrs", "<cmd>GHSubmitReview<cr>", { desc = "Submit" })
      map("n", "<leader>ghrz", "<cmd>GHCollapseReview<cr>", { desc = "Collapse" })

      map("n", "<leader>ghp", "", { desc = "Pull Request" })
      map("n", "<leader>ghpc", "<cmd>GHClosePR<cr>", { desc = "Close" })
      map("n", "<leader>ghpd", "<cmd>GHPRDetails<cr>", { desc = "Details" })
      map("n", "<leader>ghpe", "<cmd>GHExpandPR<cr>", { desc = "Expand" })
      map("n", "<leader>ghpo", "<cmd>GHOpenPR<cr>", { desc = "Open" })
      map("n", "<leader>ghpp", "<cmd>GHPopOutPR<cr>", { desc = "Pop Out" })
      map("n", "<leader>ghpr", "<cmd>GHRefreshPR<cr>", { desc = "Refresh" })
      map("n", "<leader>ghpt", "<cmd>GHOpenToPR<cr>", { desc = "Open To" })
      map("n", "<leader>ghpa", "<cmd>GHCollapsePR<cr>", { desc = "Collapse" })

      map("n", "<leader>ght", "", { desc = "Threads" })
      map("n", "<leader>ghtc", "<cmd>GHCreateThread<cr>", { desc = "Create" })
      map("n", "<leader>ghtn", "<cmd>GHNextThread<cr>", { desc = "Next" })
      map("n", "<leader>ghtt", "<cmd>GHToggleThread<cr>", { desc = "Toggle" })
    end,
  },
}
