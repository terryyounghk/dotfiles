-- https://github.com/rebelot/terminal.nvim

return {
  {
    "rebelot/terminal.nvim",
    config = function()
      require("terminal").setup({
        layout = { open_cmd = "float" },
        cmd = { vim.o.shell },
        autoclose = false,
      })

      local term_map = require("terminal.mappings")
      local map = vim.keymap.set
      map({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true, desc = "Terminal Send" })
      map("n", "<leader>to", term_map.toggle, { desc = "Terminal Toggle" })
      -- map("n", "<leader>tO", term_map.toggle({ open_cmd = "enew"}), { desc = "Terminal Toggle (enew)" })
      -- map("n", "<leader>tr", term_map.run, { desc = "Terminal Run" })
      -- map("n", "<leader>tR", term_map.run(nil, { layout = { open_cmd = "enew" } }), { desc = "Terminal Run (enew)" })
      map("n", "<leader>tk", term_map.kill, { desc = "Terminal Kill" })
      map("n", "<leader>tn", term_map.cycle_next, { desc = "Terminal Next" })
      map("n", "<leader>tp", term_map.cycle_prev, { desc = "Terminal Prev" })
      map("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }), { desc = "Terminal Move Below (vnew)"})
      -- map("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }), { desc = "Terminal Move Bottom Right (vnew)" })
      -- map("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }), { desc = "Terminal Move Below (new)"})
      -- map("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }), { desc = "Terminal Move Bottom Right (new)"})
      map("n", "<leader>tf", term_map.move({ open_cmd = "float" }), { desc = "Terminal Move float" })
    end,
  },
}
