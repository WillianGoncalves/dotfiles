require('textcase').setup {}
require('telescope').load_extension('textcase')
vim.keymap.set('n', '<leader>ttc', '<cmd>TextCaseOpenTelescope<CR>', { desc = '[T]elescope open text case' })
vim.keymap.set('v', '<leader>ttc', '<cmd>TextCaseOpenTelescope<CR>', { desc = '[T]elescope open text case' })
