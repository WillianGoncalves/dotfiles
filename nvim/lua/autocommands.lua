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

-- Some extensions break the internal VIM formatter.
-- See: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131
-- As a workaround, we disable it for all extensions, so we use internal
-- formatting for bindings like gq.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-- add jbuilder syntax highlighting
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = '*.json.jbuilder',
  command = 'set ft=ruby',
})

-- CONTROL+T opens the quickfix file in a new tab
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  command = [[nnoremap <buffer> <C-T> <C-W><Enter><C-W>T]],
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
