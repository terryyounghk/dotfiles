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
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      }
    },

    -- https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md
    lazygit = {
      configure = true,
      theme = {
        [241]                      = { fg = "Special" },
        activeBorderColor          = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor  = { fg = "Identifier" },
        cherryPickedCommitFgColor  = { fg = "Function" },
        defaultFgColor             = { fg = "Normal" },
        inactiveBorderColor        = { fg = "FloatBorder" },
        optionsTextColor           = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor       = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
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
      float = {
        position = "float",
        backdrop = {
          transparemt = true,
          blend = 40,
        },
        height = 0.7,
        width = 0.7,
        zindex = 50,
        border = "rounded",
      }
    },
  }
}
