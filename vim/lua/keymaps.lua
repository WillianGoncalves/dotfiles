local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>', ':nohlsearch<CR>', opts)
vim.keymap.set('n', ']e', ':lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '[e', ':lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
