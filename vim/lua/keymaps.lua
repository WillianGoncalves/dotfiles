local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('n', '<', '<<', opts)
