return {
  {
    -- https://github.com/zbirenbaum/copilot.lua
    "zbirenbaum/copilot.lua",
    opts = {
      server = {
        -- https://github.com/zbirenbaum/copilot.lua/discussions/468
        type = 'binary',
      },
    },
  },
  {
    -- https://github.com/CopilotC-Nvim/CopilotChat.nvim
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.25,
        },
      }
    end,
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/discussions/795#discussioncomment-12228871
      -- Add autocommand to disable <C-l> in CopilotChat buffer
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "copilot-chat",
        callback = function()
          vim.defer_fn(function()
            vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<Nop>", { noremap = true, silent = true })
          end, 100) -- Delay by 100ms to ensure plugin setup is complete
        end,
      })

      chat.setup(opts)
    end,
  }
}
