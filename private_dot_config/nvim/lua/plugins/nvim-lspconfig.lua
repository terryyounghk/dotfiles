-- https://www.lazyvim.org/plugins/lsp

return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      -- turn off inlay hints
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
