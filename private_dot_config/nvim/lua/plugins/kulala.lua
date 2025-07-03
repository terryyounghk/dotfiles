-- https://github.com/mistweaverco/kulala.nvim
-- https://www.lazyvim.org/extras/util/rest#kulalanvim

return {
  "mistweaverco/kulala.nvim",
  lazy = false,
  -- ft = "http",
  ft = {"http", "rest"},
  keys = {
    { "<leader>j", "", desc = "+Rest", ft = { "http", "rest" } },
    { "<leader>jb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad", ft = "http" },
    { "<leader>jc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
    { "<leader>jC", "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl", ft = "http" },
    {
      "<leader>jg",
      "<cmd>lua require('kulala').download_graphql_schema()<cr>",
      desc = "Download GraphQL schema",
      ft = "http",
    },
    { "<leader>ji", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request", ft = "http" },
    { "<leader>jn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request", ft = "http" },
    { "<leader>jp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request", ft = "http" },
    { "<leader>jq", "<cmd>lua require('kulala').close()<cr>", desc = "Close window", ft = "http" },
    { "<leader>jr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request", ft = "http" },
    { "<leader>js", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request", ft = "http" },
    { "<leader>jS", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats", ft = "http" },
    { "<leader>jt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body", ft = "http" },
  },
  opts = {
    global_keymaps = true,
    kulala_keymaps = true,
    global_keymaps_prefix = "<leader>j",
    kulala_keymaps_prefix = "<leader>k",
  },
}
