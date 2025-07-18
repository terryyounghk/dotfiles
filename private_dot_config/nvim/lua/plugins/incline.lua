-- lightweight floating statuslines:
-- https://github.com/b0o/incline.nvim
--
-- This is slightly modded base on the following:
-- harpoon items + positioning + file status:
-- https://github.com/b0o/incline.nvim/discussions/64
--
-- other references:
-- https://github.com/b0o/incline.nvim/issues/41
-- diagnostic + git diff + filename: https://github.com/b0o/incline.nvim/discussions/32

local colors = require("config.custom_colors")

return {
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    keys = {
      {
        "<leader>uu",
        function()
          require("incline").toggle()
        end,
        desc = "Incline Toggle",
      },
    },
    config = function()
      require("incline").setup({
        window = {
          placement = {
            vertical = "top",
            horizontal = "right",
          },
          padding = 0,
          margin = { vertical = 0, horizontal = 0 },
          zindex = 10,
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local full_path = vim.api.nvim_buf_get_name(props.buf)
          local relative_path = full_path:gsub(vim.fn.getcwd(), ".")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)

          local function get_git_diff()
            local icons = { removed = " ", changed = " ", added = " " }
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { "| " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = " ", warn = " ", info = " ", hint = " " }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(
                props.buf,
                { severity = vim.diagnostic.severity[string.upper(severity)] }
              )
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "| " })
            end
            return label
          end

          local function get_harpoon_items()
            local harpoon = require("harpoon")
            local marks = harpoon:list().items
            local current_file_path = vim.fn.expand("%:p:.")
            local label = {}

            for id, item in ipairs(marks) do
              if item.value == current_file_path then
                table.insert(label, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
              else
                table.insert(label, { id .. " ", guifg = "#434852" })
              end
            end

            if #label > 0 then
              table.insert(label, 1, { "󰛢 ", guifg = "#61AfEf" })
              table.insert(label, { "| " })
            end
            return label
          end

          local function get_file_name()
            local label = {}
            table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
            table.insert(label, { vim.bo[props.buf].modified and " " or "", guifg = "#d19a66" })
            table.insert(
              label,
              { filename , gui = vim.bo[props.buf].modified and "bold,italic" or "bold" }
            )
            if not props.focused then
              label["group"] = "BufferInactive"
            end

            return label
          end

          return {
            { " ", guibg = colors.bg.dark },
            {
              -- { get_diagnostic_label() }, -- currently causes https://github.com/LazyVim/LazyVim/issues/4756
              { get_git_diff() },
              { get_harpoon_items() },
              { get_file_name() },
              guibg = colors.bg.dark,
            },
            { " ", guibg = colors.bg.dark },
          }
        end,
      })
    end,
  },
}
