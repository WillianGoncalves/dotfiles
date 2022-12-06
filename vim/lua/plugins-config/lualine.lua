local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local tabline_status_ok, tabline = pcall(require, "tabline")
if not tabline_status_ok then
	return
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
    --padding = 2,
    disabled_filetypes = {
      statusline = { "NvimTree" },
      winbar = { "NvimTree" },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'branch',
        icons_enabled = true,
        icon = "",
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        'diff',
        colored = true,
        diff_color = {
          added    = 'StatusLineDiffAdd',
          modified = 'StatusLineDiffChange',
          removed  = 'StatusLineDiffDelete',
        },
        symbols = {added = '+', modified = '~', removed = '-'},
        --symbols = { added = " ", modified = " ", removed = " " },
        source = diff_source,
        cond = hide_in_width,
      },
      {
        'diagnostics',
        diagnostics_color = {

        },
      },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  --tabline = {
    --lualine_a = {},
    --lualine_b = {},
    --lualine_c = {},
    --lualine_x = {},
    --lualine_y = {},
    --lualine_z = {}
  --},
  winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        color = 'Tabline'
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}

tabline.setup {
  enable = false,
  options = {
    -- If lualine is installed tabline will use separators configured in lualine by default.
    -- These options can be used to override those settings.
    section_separators = {'', ''},
    component_separators = {'', ''},
    max_bufferline_percent = 80, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = true, -- shows base filename only instead of relative path in filename
    --modified_icon = "+ ", -- change the default modified icon
    modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
    show_tabs_only = true, -- this shows only tabs instead of tabs + buffers
  }
}
