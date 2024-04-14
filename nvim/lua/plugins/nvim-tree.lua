return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    vim.api.nvim_set_keymap('n', '<C-\\>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    -- close neovim if NvimTree is the last buffer
    vim.cmd([[
      autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ]])

    require('nvim-tree').setup {
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 40,
        side = 'left',
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      }
    }
  end,
}
