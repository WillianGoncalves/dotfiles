local opts = { noremap = true, silent = true }
vim.keymap.set('n', '\\', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('n', '<', '<<', opts)
-- Paste above another content with <leader>p to keep the yanked text.
vim.keymap.set('x', '<leader>p', '"_dP')
