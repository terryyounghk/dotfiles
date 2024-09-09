-- https://github.com/vuki656/package-info.nvim

return {
  {
    "vuki656/package-info.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      colors = {
        up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
        outdated = "#d19a66", -- Text color for outdated dependency virtual text
        invalid = "#ee4b2b", -- Text color for invalid dependency virtual text
      },
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = "| ✅ ", -- Icon for up to date dependencies
          outdated = "| ‼️ ", -- Icon for outdated dependencies
          invalid = "| ❌ ", -- Icon for invalid dependencies
        },
      },
      autostart = true, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
      -- The plugin will try to auto-detect the package manager based on
      -- `yarn.lock` or `package-lock.json`. If none are found it will use the
      -- provided one, if nothing is provided it will use `yarn`
      package_manager = "yarn",
    },
    config = function()
      local map = vim.keymap.set
      local p = require("package-info")
      map({ "n" }, "<leader>ns", p.show, { silent = true, noremap = true, desc = "Show dependency versions" })
      map({ "n" }, "<leader>nc", p.hide, { silent = true, noremap = true, desc = "Hide dependency versions" })
      map({ "n" }, "<leader>nt", p.toggle, { silent = true, noremap = true, desc = "Toggle dependency versions" })
      map({ "n" }, "<leader>nu", p.update, { silent = true, noremap = true, desc = "Update dependency on the line" })
      map({ "n" }, "<leader>nd", p.delete, { silent = true, noremap = true, desc = "Delete dependency on the line" })
      map({ "n" }, "<leader>ni", p.install, { silent = true, noremap = true, desc = "Install a new dependency" })
      map({ "n" }, "<leader>np", p.change_version, { silent = true, noremap = true, desc = "Install a different dependency version" })
    end,
  },
}
