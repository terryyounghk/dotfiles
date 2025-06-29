-- How to setup:
-- Add this to autocmd.lua
--   require("config.focus_highlight").enable()
-- Add this to keymaps.lua
--   vim.keymap.set("n", "<leader>uH", require("config.focus_highlight").toggle, { desc = "Toggle Focus Highlighting" })

local M = {}

-- Track if the highlighting feature is enabled
local highlight_focus_enabled = true

-- Apply highlighting to the current window
local function apply_focus_highlight()
  if highlight_focus_enabled and
    vim.bo.filetype ~= "dashboard" and
    vim.bo.filetype ~= "snacks_dashboard" and
    vim.bo.filetype ~= "" then
    -- Enable cursorline and cursorcolumn for the active window
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true

    -- Set custom background for the focused window (active pane)
    vim.cmd("setlocal winhighlight=Normal:ActivePane")
  end
end

-- Remove highlighting from the current (unfocused) window
local function remove_focus_highlight()
  if highlight_focus_enabled then
    -- Disable cursorline and cursorcolumn for unfocused windows
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false

    -- Reset the background color for the unfocused pane
    vim.cmd("setlocal winhighlight=Normal:InactivePane")
  end
end

-- Apply inactive highlighting to all panes (for FocusLost)
local function set_all_panes_inactive()
  if highlight_focus_enabled then
    -- Apply inactive styles to all windows
    vim.api.nvim_exec([[
      set nocursorline
      set nocursorcolumn
      setlocal winhighlight=Normal:InactivePane
    ]], false)
  end
end

-- Reset panes to normal behavior (for FocusGained)
local function reset_to_active_pane()
  -- Trigger WinEnter to apply highlighting for the active pane
  apply_focus_highlight()
end

-- Enable focused pane visibility enhancements
function M.enable()
  highlight_focus_enabled = true

  -- Define custom highlight groups
  vim.cmd([[
    hi! ActivePane guibg=#1c1c1c guifg=NONE
    hi! InactivePane guibg=#272822 guifg=NONE
  ]])

  -- Set autocommands to dynamically apply/remove highlighting when switching panes
  vim.api.nvim_create_autocmd({"WinEnter"}, {
    callback = function()
      apply_focus_highlight()
    end,
  })

  vim.api.nvim_create_autocmd({"WinLeave"}, {
    callback = function()
      remove_focus_highlight()
    end,
  })

  -- Handle focus events when switching Tmux panes (loss of focus)
  vim.api.nvim_create_autocmd({"FocusLost"}, {
    callback = function()
      set_all_panes_inactive()
    end,
  })

  -- Handle focus events when NeoVim regains focus
  vim.api.nvim_create_autocmd({"FocusGained"}, {
    callback = function()
      reset_to_active_pane()
    end,
  })

  -- Handle buffer switching (e.g., choosing files or buffers)
  vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function()
      apply_focus_highlight()
    end,
  })

  -- Fallback to apply highlighting after NeoVim finishes startup
  vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
      apply_focus_highlight()
    end,
  })

  -- Apply highlighting to the initial pane when NeoVim starts
  apply_focus_highlight()

  print("Focus highlighting enabled!")
end

-- Disable focused pane visibility enhancements
function M.disable()
  highlight_focus_enabled = false

  -- Remove all autocommands
  vim.api.nvim_clear_autocmds({ event = {"WinEnter", "WinLeave", "FocusLost", "FocusGained", "BufEnter", "VimEnter"} })

  -- Disable cursorline and cursorcolumn globally
  vim.cmd([[
    set nocursorline
    set nocursorcolumn
    hi! clear ActivePane
    hi! clear InactivePane
  ]])

  -- Reset highlighting for all windows to the default
  vim.cmd("setlocal winhighlight=Normal:Normal")

  print("Focus highlighting disabled!")
end

-- Toggle the highlighting feature
function M.toggle()
  if highlight_focus_enabled then
    M.disable()
  else
    M.enable()
  end
end

return M
