-- https://github.com/folke/noice.nvim
-- https://www.lazyvim.org/plugins/ui#noicenvim

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        -- override default split view to always enter the split when it opens
        split = {
          enter = true,
          position = "top",
        },
        cmdline_popup = {
          -- slightly near center
          position = {
            row = "40%",
            col = "50%",
          },
          size = {
            width = 80,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          -- slightly near center
          position = {
            row = "40%",
            col = "50%",
          },
          size = {
            width = 80,
            height = 10
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    },
    keys = {
      { "<leader>N", "", desc = "Notifications"},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>Nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>Nh", "<cmd>Noice fzf<cr>", desc = "Noice History"},
      { "<leader>Ng", "<cmd>Noice log<cr>", desc = "Noice Logs"},
      { "<leader>Ne", "<cmd>Noice errors<cr>", desc = "Noice Errors"},
      { "<leader>Na", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>Nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },
}
