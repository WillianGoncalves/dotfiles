return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
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

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { "NvimTree" },
          winbar = { "NvimTree" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
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
        lualine_c = {
          {
            'lsp_progress',
            separators = {
              component = ' ',
              lsp_client_name = { pre = '', post = '' },
              spinner = { pre = '', post = ' ' },
            },
            display_components = { 'lsp_client_name', 'spinner' },
            timer = { progress_enddelay = 0, spinner = 1000, lsp_client_name_enddelay = 0 },
            spinner_symbols = { '   ', '.  ', '.. ', '...' },
          }
        },
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
  end
}
