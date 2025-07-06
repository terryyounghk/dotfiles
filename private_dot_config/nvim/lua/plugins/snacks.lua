-- https://github.com/folke/snacks.nvim

local logo = [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⢷⣿⡚⠻⠿⣷⣶⣤⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡿⣦⠀⠀⠈⠉⠳⢯⣳⣄⡀⠀⠀⠀⠀⠀⠀⠀⡀⣀⣀⠀⠀⢀⣤⣤⣴⣶⡿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣾⣧⠀⡀⠀⠀⠀⠙⠳⣿⣗⣦⣖⠒⠊⠉⠉⠀⠀⠈⠉⣩⡽⠟⢋⣡⣤⠶⠶⠾⠿⠿⠿⢶⣖⣒⡾⠿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠘⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⣠⡾⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⢶⣿⣅⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣧⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣝⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠉⠁⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡙⠛⢻⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢠⡟⠀⠀⠀⠀⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⣿⣶⠄⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⡀⠀⠀⠀⠀⠀⠀⣸⡁⣾⠇⠀⠀⠀⠀⢿⡙⢷⣬⣵⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠔⠋⢀⣴⡿⠉⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀⣿⠙⠿⣿⣆⠀⢲⡗⠚⠃⣀⣽⣶⣽⣿⣷⠀⠰⣄⠀⠀⠀⠀⠀⠉⠁⠀⣠⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣨⣿⣿⣶⣄⡀⠀⢿⣇⢲⣌⢻⠀⣼⠀⠀⢸⢹⣿⣿⣿⡿⣿⣧⣄⣙⣻⣷⡶⢶⣤⣴⣶⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⠿⠛⣉⠿⠒⣿⣿⣿⣿⡖⠿⡆⢻⣿⡇⢷⠀⠀⠘⣿⣿⣿⠟⠀⠸⡟⠊⠉⠉⣁⣴⣿⡟⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡿⠛⣉⡤⠖⢋⣠⣴⣄⣼⣿⣿⡿⠷⢦⣿⣄⣨⡇⠘⣷⡀⠀⠈⠛⠧⠤⠤⠒⠃⠀⠀⢰⣿⣿⠃⣽⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⣠⣴⡿⠋⣡⠴⠋⣡⡴⢾⣏⣁⣼⡿⠟⠉⠀⠀⠀⠀⠈⠻⣿⣧⠀⢸⡇⠀⠀⠿⢷⣦⣀⠀⠀⢰⠆⠘⠻⢟⣿⠿⣿⣦⡤⣤⠀⠀⣀⣠⣴⣶⠿⠿⠛⠛⠛⡿
 ⠀⠀⠀⠀⠀⢀⣼⡟⢁⡴⠋⣡⡴⠛⣿⣄⣰⠿⠋⠁⠀⠀⠀⣀⣤⠶⢾⠷⢦⣽⡏⠳⣄⣿⣦⡀⠀⠀⠀⠈⠉⠓⠂⣀⣤⣴⣿⣧⣤⣤⡾⠟⠁⣠⣾⣿⠛⠁⠀⠀⠀⠀⠀⠀⠇
 ⠀⠀⠀⠀⣠⣿⠋⣰⠋⣠⢾⡏⠀⢀⣿⠟⠁⠀⠀⠀⠀⣰⡟⠉⠀⠀⢸⠀⢸⡟⠛⣶⡾⠛⠁⠛⢿⣶⣦⣤⣶⣶⣾⠿⠛⠋⠀⠉⠋⠉⠀⣠⣾⠟⢁⠇⠀⠀⠀⠀⠀⠀⠀⣴⠆
 ⠀⠀⠀⣰⣿⠃⡴⢃⣾⣇⠈⣷⣴⡿⠁⠀⠀⠀⢀⡄⠠⣯⣿⠀⠀⠀⢸⠀⢸⣷⢞⣽⣿⣥⠶⠶⣿⢻⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠟⠁⠀⣸⠀⠀⠀⠀⠀⠀⠀⣼⡟⠀
 ⠀⠀⢠⣿⠃⡼⢁⡾⢙⣿⣤⣾⡿⠀⠀⠀⠀⠀⠈⠀⠀⠸⠿⣇⠀⠀⢸⠀⠀⣿⣿⣿⡍⠀⠀⣆⠸⣿⡀⠀⠀⠀⠀⠀⠀⠀⢀⡤⣺⠟⠁⠀⢀⡴⠋⠓⠒⠒⠤⠤⣠⢾⠟⠀⠀
 ⠀⠀⡼⡏⢰⣧⣼⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡄⠀⢸⠀⠀⢹⣿⣿⣿⡀⠀⢸⡀⢻⣧⠀⠀⠀⠀⠀⢀⣴⣿⠟⠁⠀⣠⠖⠉⠀⠀⠀⠀⣠⡴⣿⠗⠉⠀⠀⠀
 ⠀⣠⣧⣷⣿⡻⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⠀⠈⣇⠀⠘⣿⣿⣿⣇⠀⠀⣇⠈⣿⣇⠀⠀⢀⣴⡿⠛⠁⢀⡤⠊⠁⠀⠀⠀⣀⣴⣺⠵⠋⠁⠀⠀⠀⠀⠀
 ⣴⡿⠁⠹⢤⣿⣃⣀⣿⣿⣿⠷⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⡆⠀⠸⡆⠀⢹⣿⣿⣿⡀⠀⢹⠀⣿⡿⣶⣴⡿⠋⠀⣠⠔⠋⠀⠀⠀⢀⣴⣾⠿⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀
 ⣿⣴⡶⠀⠰⣟⣶⣹⣿⣿⣷⣤⣀⣈⠉⣹⠟⠳⢶⡶⢛⡿⠛⢿⡟⣿⡄⠀⠹⡀⠀⢿⣿⣿⣇⠀⠈⣾⡟⣠⣿⠋⢀⡤⠚⠁⠀⠀⢀⣤⣾⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠻⠿⢶⣶⣶⣾⣿⣯⣁⣿⠉⠙⠛⠻⠿⢥⣤⣤⣼⣇⢸⣘⣹⣸⡿⠟⢿⡄⠀⢳⡀⠈⢷⣿⣿⠀⢸⡏⣧⢿⢸⡴⠋⠀⠀⢀⣤⣾⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠈⠙⠯⣿⣿⠀⠀⠀⠀⠀⠀⠘⢿⣍⠙⠳⠶⠾⠋⠀⠀⠀⢻⣆⠀⢳⣀⣘⣿⣻⣷⡿⣿⢸⣾⣆⢳⣄⣤⣾⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⢀⣠⡤⢤⣤⣀⣙⣿⡶⣤⣀⣀⣀⠀⠀⢀⣹⣧⣴⠏⠀⠀⢸⡿⣿⣿⣧⢻⡻⠶⠻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⣤⣾⡛⠁⠀⠀⢳⡀⠹⣯⣳⣄⣉⣉⣡⣤⣶⠛⠉⡽⣿⡀⢀⠀⠘⣿⣿⣽⣝⢷⣿⣦⣼⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢉⢿⣿⡿⠆⠀⠀⠀⠳⡀⣿⡟⠛⠛⠛⠛⠓⢬⡳⠾⣷⡿⣧⡀⠀⣤⣿⣿⣿⡟⠉⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⢰⣻⠟⠙⣧⡀⠀⠀⣀⣠⣿⣿⠃⠀⠀⠀⠀⠀⠀⠈⢷⣾⡷⠿⣿⣿⣽⣷⡏⠻⣟⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⣯⡟⠰⣾⣿⣿⣶⢿⣻⡿⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⢿⡻⣿⣿⣿⣦⡙⣿⡷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⢿⢿⣾⣿⣿⣿⡿⣍⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢾⣿⣿⣿⣿⣿⣿⣮⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀                ⠀⠀⠀⠀⠀⠀⠀⠀                ⠀⠀⠀⠀⠀⠀⠀⠀
                            - neovim -   ⠀⠀⠀⠀⠀⠀⠀⠀                ⠀
      ]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

return
{
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    -- Remap n, as it clashes with something else
    { "<leader>n", false},
  },
  opts = {

    -- https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md
    bigfile = {
      notify = true,
      size = 1024 * 1024 * 1,
      line_length= 1000,
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
    dashboard = {
      preset = {
        header = logo,
        pick = function (cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,

        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":FzfLua files" },
          -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":FzfLua live_grep" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load({ last = true })" },
          { icon = " ", key = "S", desc = "Select Session", action = ":lua require('persistence').select()" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      }
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
    lazygit = {
      configure = false,
      win = {
        style = "lazygit_fullscreen",
      },
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/terminal.md
    terminal = {
      win = {
        style = "float",
      },
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/styles.md
    styles = {
      -- override the default float style
      float = {
        position = "float",
        backdrop = {
          transparemt = true,
          blend = 40,
        },
        height = 0.9,
        width = 0.9,
        zindex = 50,
        border = "rounded",
      },
      -- custom style for lazygit
      lazygit_fullscreen = {
        width = 0.95,
        height = 0.95,
        zindex = 50,
        border = "rounded",
        backdrop = {
          transparent = true,
          blend = 40,
        },
      },
    },
  },
}
