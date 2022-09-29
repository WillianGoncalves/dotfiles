vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  pattern = '*',
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None"
})

-- check if any buffers were changed outside of Vim
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  command = "if mode() != 'c' | checktime | endif"
})

-- git commit with 72 columns
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'gitcommit',
  command = 'setlocal spell textwidth=72'
})
