-- https://github.com/iamcco/markdown-preview.nvim

-- Currenly needs to manually install:
-- https://github.com/iamcco/markdown-preview.nvim/issues/695
-- Run this:
-- cd ~/.local/share/nvim/lazy/markdown-preview.nvim
-- yarn install

return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mv", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview"},
      { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Stop"},
      { "<leader>mt", "<cmd>MarkdownPreviewToggle", desc = "Markdown Toggle"},
    },
  },
}
