-- https://www.lazyvim.org/plugins/lsp

return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      -- turn off inlay hints
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
