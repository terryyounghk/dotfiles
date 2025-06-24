return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    keys = {
      -- This prevents flash.nvim from overriding mini.surround functionality
      -- https://github.com/folke/flash.nvim/discussions/251
      -- This also restores the default "s" behavior in vim
      { "s", mode = {"n", "x"}, false},

      -- This uses ENTER instead of "s" to trigger Flash
      { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },

      -- This makes Flash available via which-key
      -- and keeps Flash accessible in places where ENTER key confirms a selection
      -- such as oil.nvim or Harpoon
      { "<leader>sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },

      { "S", mode = { "n", "o", "x", "v" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },

      -- You can toggle while you're in the Search input box (hence the "c" mode)
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

      -- Add this to make the option more noticeable
      { "<leader>uS", mode = { "n" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  }
}
