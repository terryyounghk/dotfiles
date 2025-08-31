local icon_list = {}
local mdi_list = {}

-- A hacky solution to insert the icon name instead of the icon itself.
-- This is modified from fetcher.insert_icon_from_list
local insert_name_from_list = function()
  if next(icon_list) == nil then
    icon_list = require('nerdy.icons')
  end
  local list_title = "Nerdy Icons - Insert Name"
  local recents = require('nerdy.recents')
  local config_module = require('nerdy.config')
  local initial_mode = vim.api.nvim_get_mode().mode
  local cursor_position = vim.api.nvim_win_get_cursor(0)

  vim.ui.select(icon_list, {
    prompt = list_title,
    format_item = function(item)
      local item_str = string.format('%s (%s) : %s', item.name, item.code, item.char)
      return item_str
    end,
  }, function(item, _)
    if item ~= nil then
      recents.add_to_recent(item)
      if config_module.config.copy_to_clipboard then
        vim.fn.setreg('+', item.name) -- return name instead of char
        return
      end
      if initial_mode == 'i' then
        vim.cmd('startinsert')
      end
      vim.api.nvim_win_set_cursor(0, cursor_position)
      vim.api.nvim_put({ item.name }, 'c', false, true) -- name instead of char
    end
  end)
end

-- This only shows Material Design Icons (mdi) from the Nerd Fonts set,
-- where the official icon picker refers to names in
-- kebab-case with the `mdi:` prefix.
-- https://pictogrammers.com/library/mdi/
-- https://pictogrammers.com/docs/library/mdi/guides/home-assistant/
--
-- I also use this for "Custom SVG Glyphs" in keymap-drawer:
-- https://github.com/caksoylar/keymap-drawer/blob/cd716e07453ad3b8fc10f905d3a0eebc61dd9450/README.md#custom-svg-glyphs
--
-- Because Nerd Fonts removed `mdi` icons and introduced `md` icons
-- into new codepoints (https://github.com/ryanoasis/nerd-fonts/pull/773)
-- The prefix in this list is `md:` instead of `mdi:`, which is not
-- useful for the specific format I needed.
local insert_mdi_name_from_list = function()
  if next(icon_list) == nil then
    icon_list = require('nerdy.icons')
  end
  if next(mdi_list) == nil then
    for _, icon in ipairs(icon_list) do
      if icon.name:match("^md%-") then
        local new_name = icon.name:gsub("^(%a+)%-", "mdi:"):gsub("_", "-")
        local new_icon = { name = new_name, code = icon.code, char = icon.char }
        table.insert(mdi_list, new_icon)
      end
    end
  end
  local list_title = "Material Design Icons - Insert Name"
  local recents = require('nerdy.recents')
  local config_module = require('nerdy.config')
  local initial_mode = vim.api.nvim_get_mode().mode
  local cursor_position = vim.api.nvim_win_get_cursor(0)

  vim.ui.select(mdi_list, {
    prompt = list_title,
    format_item = function(item)
      local item_str = string.format('%s (%s) : %s', item.name, item.code, item.char)
      return item_str
    end,
  }, function(item, _)
    if item ~= nil then
      recents.add_to_recent(item)
      if config_module.config.copy_to_clipboard then
        vim.fn.setreg('+', item.name)
        return
      end
      if initial_mode == 'i' then
        vim.cmd('startinsert')
      end
      vim.api.nvim_win_set_cursor(0, cursor_position)
      vim.api.nvim_put({ item.name }, 'c', false, true) -- name instead of char
    end
  end)
end

return {
  -- https://github.com/2KAbhishek/nerdy.nvim
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  cmd = 'Nerdy',
  keys = {
    { "<leader>tj", "<cmd>Telescope nerdy<cr>", desc = "Nerdy - Insert Icon" }, -- Use Telescope nerdy command
    { "<leader>ti", "<cmd>Nerdy<cr>", desc = "Nerdy - Insert Icon (fzf)" },
    { "<leader>tn", insert_name_from_list, desc = "Nerdy - Insert Icon Name" },
    { "<leader>tm", insert_mdi_name_from_list, desc = "Nerdy - Insert MDI Name" },
  },
  opts = {
    max_recents = 30, -- Configure recent icons limit
    add_default_keybindings = true, -- Add default keybindings
    copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
  },
  config = function(_, opts)
    require('nerdy').setup(opts)
    require('telescope').load_extension('nerdy')
  end,
}
