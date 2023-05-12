-- use <C-space> to trigger completion
vim.api.nvim_set_keymap('i', '<C-space>', "vim.fn['coc#refresh']()", { expr = true, noremap = true, silent = true })

-- jump to next snippet
vim.api.nvim_set_keymap('i', '<C-j>', [[
  vim.fn['coc#pum#visible']() and
  vim.fn['coc#pum#next'](1) or
  <C-j>
]], { expr = true, noremap = true })

-- jump to previous snippet
vim.api.nvim_set_keymap('i', '<C-k', [[
  vim.fn['coc#pum#visible']() and
  vim.fn['coc#pum#prev'](1) or
  <C-k>
]], { expr = true, noremap = true })

vim.api.nvim_set_keymap('i', '<TAB>', [[
  vim.fn['coc#pum#visible']() and
  vim.fn['coc#pum#next'](1) and
  vim.api.nvim_exec(check_backspace, true) and
  <TAB> or
  vim.fn['coc#refresh']()
]], { expr = true, silent = true, noremap = true })

vim.api.nvim_set_keymap('i', '<S-TAB>', [[
  vim.fn['coc#pum#visible']() and
  vim.fn['coc#pum#prev'](1) or
  <C-h>
]], { expr = true, noremap = true })

vim.api.nvim_set_keymap('i', '<CR>', [[
  vim.fn['coc#pum#visible']() and
  vim.fn['coc#pum#confirm']() or
  \<C-g>u\<CR>\<c-r>=vim.fn['coc#on_enter']()\<CR>
]], { expr = true, silent = true, noremap = true })

vim.api.nvim_set_keymap('i', '<down>', [[
  vim.fn['coc#float#has_scroll']() and
  vim.fn['coc#pum#scroll'](1) or
  \<down>
]], { expr = true, silent = true, noremap = true })

vim.api.nvim_set_keymap('i', '<up>', [[
  vim.fn['coc#float#has_scroll']() and
  vim.fn['coc#pum#scroll'](0) or
  \<up>
]], { expr = true, silent = true, noremap = true })

vim.api.nvim_set_keymap('n', 'K', '[[vim.api.nvim_exec(check_backspace)]]', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', 'gD', [[<Plug>(coc-definition)]], { silent = true })
vim.api.nvim_set_keymap('n', 'gy', [[<Plug>(coc-type-definition)]], { silent = true })
vim.api.nvim_set_keymap('n', 'gi', [[<Plug>(coc-implementation)]], { silent = true })
vim.api.nvim_set_keymap('n', 'gr', [[<Plug>(coc-references)]], { silent = true })
vim.api.nvim_set_keymap('n', ']e', [[<Plug>(coc-diagnostic-next)]], {})
vim.api.nvim_set_keymap('n', '[e', [[<Plug>(coc-diagnostic-prev)]], {})
vim.api.nvim_set_keymap('n', '<leader>rf', [[<Plug>(coc-refactor)]], {})
vim.api.nvim_set_keymap('n', '<leader>rn', [[<Plug>(coc-rename)]], {})
vim.api.nvim_set_keymap('n', '<leader>ac', [[<Plug>(coc-codeaction)]], {})
vim.api.nvim_set_keymap('n', 'qf', [[<Plug>(coc-fix-current)]], {})

local check_backspace = [[
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  call s:CheckBackspace()
]]

local show_documentation = [[
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
]]

--vim.go.coc_snippet_next = '<c-n>'
--vim.o.coc_snippet_prev = '<c-p>'
