-- if true then return {} end

return {
  {
    'rebelot/terminal.nvim',
    config = function()
      require("terminal").setup({
        layout = { open_cmd = "float" },
        cmd = { vim.o.shell },
        autoclose = false,
      })
    end
  }
}
