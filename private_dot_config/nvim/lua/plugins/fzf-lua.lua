-- https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    winopts = {
      preview = {
        vertical = "up:85%",
        layout = "vertical",
        scrollchars = { "┃", "" },
      },
      oldfiles = {
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- avoid Treesitter parsing large files by telling previewer
          -- not to add syntax highlighting to files larger than this size
          syntax_limit_b = 1024 * 100, -- 100kb
        }
      },
    },
  }
}
