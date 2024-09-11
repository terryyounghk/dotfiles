-- force enable gitsigns.nvim with the largely similar full specs LazyVim implements
-- while also having mini.diff to also work at the same time
--
-- https://www.lazyvim.org/plugins/editor#gitsignsnvim

return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      signs_staged_enable = true,
      attach_to_untracked = true,
      signcolumn = true,
      linehl = false,
      numhl = true,
      word_diff = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")

        map("n", "<leader>gi", "", "Gitsigns")
        map("n", "<leader>gil", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "<leader>gif", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>gis", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>gir", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>giS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>giu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>giR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gip", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>gib", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>giB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>gid", gs.diffthis, "Diff This")
        map("n", "<leader>giD", function() gs.diffthis("~") end, "Diff This ~")
        map("n", "<leader>gih", "<cmd>Gitsigns toggle_numhl<CR><cmd>Gitsigns toggle_linehl<CR>", "Toggle Highlight")
        map("n", "<leader>gic", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Line Blame")
        map({ "o", "x" }, "gih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
