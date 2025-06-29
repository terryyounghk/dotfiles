-- https://github.com/LukasPietzschmann/telescope-tabs

return {
  {
    "LukasPietzschmann/telescope-tabs",
    enabled = false,
    config = function()
      require("telescope").load_extension("telescope-tabs")
      local tabs = require("telescope-tabs")
      tabs.setup({
        -- this function changes how a tab is represented in the picker
        entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
          local entry_string = table.concat(
            vim.tbl_map(function(v)
              return vim.fn.fnamemodify(v, ":.")
            end, file_paths),
            ", "
          )
          return string.format("%d: %s%s", tab_id, entry_string, is_current and " <" or "")
        end,

        -- this function changes how tabs are sorted in the picker
        entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
          return table.concat(file_names, " ")
        end,

        vim.keymap.set("n", "<leader><tab>e", ":Telescope telescope-tabs list_tabs<CR>", { desc = "Lists Tabs" }),
      })
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
