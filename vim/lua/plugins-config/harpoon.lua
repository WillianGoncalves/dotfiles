vim.keymap.set('n', '<leader>hm', '<cmd>lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<leader>hf', '<cmd>Telescope harpoon marks<CR>')
vim.keymap.set('n', '<leader>hc', '<cmd>lua require("harpoon.mark").clear_all()<CR>')
