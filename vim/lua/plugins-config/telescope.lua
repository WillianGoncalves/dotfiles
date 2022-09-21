local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_create_user_command('Colors', 'Telescope colorscheme', {})

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-y>"] = actions.preview_scrolling_up,
        ["<C-e>"] = actions.preview_scrolling_down,
      },
    },
  },
}
