local opts = { noremap = true, silent = true }
vim.keymap.set('n', '\\', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('n', '<', '<<', opts)
-- Paste above another content with <leader>p to keep the yanked text.
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', 'U', ':Gread<CR>', opts)

-- 'vv' select the entire line
vim.api.nvim_set_keymap('n', 'vv', 'V', { noremap = true, silent = true })

-- 'V' select from cursor to end of line
vim.api.nvim_set_keymap('n', 'V', 'vg_', { noremap = true, silent = true })

-- map 'C' to black hole register ("_) so that it does not replace yanked text
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true })
