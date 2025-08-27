-- use my existing color scheme
-- TODO: Is there a way to share this among nvim and yazi?
local colors =  {
  fg = {
    black = "#000000",
    white = "#ffffff",

    light = "#eeeeee",
    normal = "#bcbcbc",
    dark = "#949494",

    red = "#ff5faf",
    orange = "#ffaf00",
    yellow = "#ffd700",
    green = "#5fff01",
    blue = "#5fffff",
    violet = "#af87ff",
    magenta = "#d75fff",
  },
  bg = {
    none = "NONE",

    black = "#000000",
    white = "#ffffff",

    light = "#767676",
    normal = "#4e4e4e",
    dark = "#1c1c1c",

    red = "#5f0000",
    orange = "#af5f00",
    yellow = "#5f5f00",
    green = "#005f00",
    blue = "#005fd7",
    violet = "#5f00ff",
    magenta = "#5f0087",
  },
}

local monokai_theme = {
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },

	style_a = {
		fg = colors.fg.white,
		bg_mode = {
			normal = colors.bg.blue,
			select = colors.bg.green,
      visual = colors.bg.red,
      command = colors.bg.orange,
			un_set = colors.bg.yellow,
		}
	},
	style_b = { bg = colors.bg.normal, fg = colors.fg.blue },
	style_c = { bg = colors.bg.black, fg = colors.fg.white },

	permissions_t_fg = colors.fg.green,
	permissions_r_fg = colors.fg.yellow,
	permissions_w_fg = colors.fg.red,
	permissions_x_fg = colors.fg.blue,
	permissions_s_fg = colors.fg.magenta,

	selected = { icon = "󰻭", fg = colors.fg.yellow },
	copied = { icon = "", fg = colors.fg.green },
	cut = { icon = "", fg = colors.fg.red },
	files = { icon = "", fg = colors.fg.blue },
	filtereds = { icon = "", fg = colors.fg.magenta },

	total = { icon = "󰮍", fg = colors.fg.yellow },
	succ = { icon = "", fg = colors.fg.green },
	fail = { icon = "", fg = colors.fg.red },
	found = { icon = "󰮕", fg = colors.fg.blue },
	processed = { icon = "󰐍", fg = colors.fg.green },
}

-- https://github.com/imsi32/yatline.yazi/wiki
require("yatline"):setup({
  theme = monokai_theme,

  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },

  show_background = true,

  tab_width = 20,
  tab_use_inverse = false,

  display_header_line = true,
  display_status_line = true,

  component_positions = { "header", "tab", "status" },

  header_line = {
    left = {
      section_a = {
        {type = "line", custom = false, name = "tabs", params = {"left"}},
      },
      section_b = {
      },
      section_c = {
      }
    },
    right = {
      section_a = {
        {type = "string", custom = false, name = "date", params = {"%Y-%m-%d %X "}},
      },
      section_b = {
      },
      section_c = {
      }
    }
  },

  status_line = {
    left = {
      section_a = {
        {type = "string", custom = false, name = "tab_mode"},
      },
      section_b = {
        {type = "string", custom = false, name = "hovered_size"},
      },
      section_c = {
        -- {type = "string", custom = false, name = "hovered_path"},
        {type = "coloreds", custom = false, name = "tab_path"},
        {type = "coloreds", custom = false, name = "githead"},
        {type = "coloreds", custom = false, name = "count"},
      }
    },
    right = {
      section_a = {
        {type = "string", custom = false, name = "cursor_position"},
      },
      section_b = {
        {type = "string", custom = false, name = "cursor_percentage"},
      },
      section_c = {
        {type = "coloreds", custom = false, name = "hostname_username"},
        {type = "string", custom = false, name = "hovered_file_extension", params = {true}},
        {type = "coloreds", custom = false, name = "permissions"},
      }
    }
  },
})

-- https://github.com/blackdaemon/yatline-tab-path.yazi
-- require("yatline-tab-path"):setup()
require("yatline-tab-path"):setup({
  path_fg = "cyan",
  filter_fg = "brightyellow",
  search_label = " search",
  filter_label = " filter",
  no_filter_label = "",
  flatten_label = " flatten",
  separator = "  ",
})

-- https://github.com/jaja360/yatline-hostname-username.yazi
require("yatline-hostname-username"):setup({
  color = "silver",
  mode = "both" -- "host", "user", "both"
})

-- https://github.com/imsi32/yatline-githead.yazi
-- TODO: theme with my colorscheme
-- require("yatline-githead"):setup()
require("yatline-githead"):setup({
  show_branch = true,
  branch_prefix = "on",
  prefix_color = "white",
  branch_color = "blue",
  branch_symbol = "",
  branch_borders = "()",

  commit_color = "bright magenta",
  commit_symbol = "@",

  show_behind_ahead = true,
  behind_color = "bright magenta",
  behind_symbol = "⇣",
  ahead_color = "bright magenta",
  ahead_symbol = "⇡",

  show_stashes = true,
  stashes_color = "bright magenta",
  stashes_symbol = "$",

  show_state = true,
  show_state_prefix = true,
  state_color = "red",
  state_symbol = "~",

  show_staged = true,
  staged_color = "bright yellow",
  staged_symbol = "+",

  show_unstaged = true,
  unstaged_color = "bright yellow",
  unstaged_symbol = "!",

  show_untracked = true,
  untracked_color = "blue",
  untracked_symbol = "?",
})

-- https://github.com/MasouShizuka/projects.yazi
require("projects"):setup({
  save = {
    method = "yazi", -- yazi | lua
    yazi_load_event = "@projects-load", -- event name when loading projects in `yazi` method
    -- lua_save_path = "", -- path of saved file in `lua` method, comment out or assign explicitly
    --                     -- default value:
    --                     -- windows: "%APPDATA%/yazi/state/projects.json"
    --                     -- unix: "~/.local/state/yazi/projects.json"
  },
  last = {
    update_after_save = true,
    update_after_load = true,
    -- TODO: revise neovim keymap and zmk combo to always load last project
    load_after_start = true,
  },
  merge = {
    event = "projects-merge",
    quit_after_merge = false,
  },
  event = {
    save = {
      enable = true,
      name = "project-saved",
    },
    load = {
      enable = true,
      name = "project-loaded",
    },
    delete = {
      enable = true,
      name = "project-deleted",
    },
    delete_all = {
      enable = true,
      name = "project-deleted-all",
    },
    merge = {
      enable = true,
      name = "project-merged",
    },
  },
  notify = {
    enable = true,
    title = "Projects",
    timeout = 3,
    level = "info",
  },
})

-- https://github.com/AnirudhG07/plugins-yazi/tree/main/copy-file-contents.yazi
require("copy-file-contents"):setup({
  append_char = "\n",
  notification = true,
})

-- https://github.com/yazi-rs/plugins/tree/main/smart-enter.yazi#advanced
require("smart-enter"):setup {
  open_multi = true,
}

-- https://github.com/wylie102/duckdb.yazi/tree/main?tab=readme-ov-file#installation
-- TODO: duckdbrc - https://github.com/wylie102/duckdb.yazi/tree/main?tab=readme-ov-file#configuring-duckdb
-- require("duckdb"):setup()
require("duckdb"):setup({
  mode = "standard",                         -- Default: "summarized"
  cache_size = 1000,                         -- Default: 500
  row_id = "dynamic",                        -- Default: false
  minmax_column_width = 21,                  -- Default: 21
  column_fit_factor = 10.0,                  -- Default: 10.0
})

-- https://github.com/dedukun/relative-motions.yazi
require("relative-motions"):setup({
  show_numbers="relative",
  show_motion = true,
  enter_mode ="first",
})

-- https://github.com/yazi-rs/plugins/tree/main/toggle-pane.yazi
if os.getenv("NVIM") then
  require("toggle-pane"):entry("min-preview")
end
