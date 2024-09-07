-- Lualine Defaults: https://github.com/nvim-lualine/lualine.nvim
-- LazyVim Lualine Defaults: https://www.lazyvim.org/plugins/ui#lualinenvim

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- remove section separators; they don't look good with transparency
        section_separators = {
          left = ' ',
          right = ' ',
        }
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 3,
            shorting_target = 0, -- no shortening, show everything
          }
        }
      }
    }
  }
}
