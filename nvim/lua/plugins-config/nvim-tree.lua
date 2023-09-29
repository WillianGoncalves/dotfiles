-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
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
})

opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-\\>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
