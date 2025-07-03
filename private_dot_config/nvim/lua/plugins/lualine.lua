-- Lualine Defaults: https://github.com/nvim-lualine/lualine.nvim
-- LazyVim Lualine Defaults: https://www.lazyvim.org/plugins/ui#lualinenvim

local colors = require("config.custom_colors");

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", {
      bg = colors.modes["MACRO"],
    })
    require("lualine").refresh()
  end
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", {
      bg = colors.modes["NORMAL"],
    })
    require("lualine").refresh()
  end
})

return {
  { "ofseed/copilot-status.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require("lualine")
      local get_mode = require("lualine.utils.mode").get_mode

      local table_merge = function(first_table, second_table)
        for k, v in pairs(second_table) do
          first_table[k] = v
        end
        return first_table
      end

      local dynamic_mode_bg = function(c)
        local fn = function()
          -- local mode = vim.fn.mode(false)
          local mode = get_mode()
          local b = { bg = colors.modes[mode] }
          local t = table_merge(c, b)
          return t
        end
        return fn
      end

      -- Add recording indicator component
      local macro_recording = function()
        local reg = vim.fn.reg_recording()
        return reg ~= "" and " REC @" .. reg or ""
      end

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      -- Config
      local config = {
        options = {
          globalstatus = true,
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            -- normal = { c = { fg = colors.fg.fg, bg = colors.fg.bg } },
            normal = {
              c = dynamic_mode_bg({}),
            },
            inactive = { c = { fg = colors.fg.dark, bg = colors.bg.none } },
          },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left({
        "filename",
        cond = conditions.buffer_not_empty,
        path = 3,
        shorting_target = 100,
        color = dynamic_mode_bg({ fg = colors.fg.red, gui = "bold" }),
        padding = 0,
      })

      ins_left({
        "branch",
        icon = "",
        color = dynamic_mode_bg({ fg = colors.fg.green }),
      })

      -- Insert mid section.
      -- ins_left({
      --   function()
      --     return "%="
      --   end,
      -- })

      ins_left({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "󰝤 ", removed = " " },
        diff_color = {
          added = dynamic_mode_bg({ fg = colors.fg.blue }),
          modified = dynamic_mode_bg({ fg = colors.fg.orange }),
          removed = dynamic_mode_bg({ fg = colors.fg.red }),
        },
        cond = conditions.hide_in_width,
      })

      ins_left({ "searchcount", color = dynamic_mode_bg({ fg = colors.fg.red }) })
      ins_left({ "selectioncount", color = dynamic_mode_bg({ fg = colors.fg.red }) })
      ins_left({ "location", color = dynamic_mode_bg({ fg = colors.fg.yellow }) })
      ins_left({ "progress", color = dynamic_mode_bg({ fg = colors.fg.orange }) })
      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          error = dynamic_mode_bg({ fg = colors.fg.red }),
          warn = dynamic_mode_bg({ fg = colors.fg.yellow }),
          info = dynamic_mode_bg({ fg = colors.fg.green }),
        },
      })

      -- Add components to right sections

      ins_right({
        macro_recording,
        color = { fg = colors.fg.red, bg = colors.bg.yellow },  -- orange text
        separator = { left = "", right = "" },
      })

      ins_right({
        "copilot",
        show_running = true,
        symbols = {
          status = {
            enabled = "Copilot: ",
            disabled = "Copilot:  ",
          },
          spinners = require("copilot-status.spinners").dots,
        },
        color = dynamic_mode_bg({ fg = colors.fg.blue }),
      })

      ins_right({
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = dynamic_mode_bg({ fg = colors.fg.green }),
      })

      ins_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = false, -- show text instead
        color = dynamic_mode_bg({ fg = colors.fg.red }),
      })

      -- Now don't forget to initialize lualine
      lualine.setup(config)
    end,
  },
}
