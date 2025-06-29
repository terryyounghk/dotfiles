-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    opts = {
      defaults = {
        winblend = 0,
        preview = {
          hide_on_startup = false,
        },
        sorting_strategy = "ascending", -- this also puts the resuts aligned to top
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            anchor = "N",
            preview_width = 0.65,
            preview_cutoff = 30,
          },
          vertical = {
            prompt_position = "top",
            anchor = "N",
            preview_height = 0.75,
            preview_cutoff = 30,
          },
        },
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
          },
          i = {
            ["<M-p>"] = action_layout.toggle_preview,
            -- ["<C-u>"] = false, -- clear the prompt
            -- ["<esc>"] = actions.close, -- quit in insert mode
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
          },
        },
      },
      pickers = {
        buffers = {
          previewer = true,
          mappings = {
            n = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
              ["l"] = "select_default",
            },
            i = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
        find_files = {
          previewer = true,
        },
      },
    },
  },
}
