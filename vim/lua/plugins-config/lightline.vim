function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['gitbranch', 'readonly'],
      \     ['filename', 'modified'],
      \   ],
      \   'right': [
      \     [ 'lsp_errors', 'lsp_warnings', 'lsp_info', 'lsp_hints', 'lsp_ok' ],
      \     [ 'percent', 'lineinfo' ],
      \     [ 'gitstatus', 'filetype' ],
      \   ]
      \ },
      \ 'tabline': {'left': [['tabs']], 'right': [[]]},
      \ 'component_function': {'gitbranch': 'FugitiveHead', 'gitstatus': 'GitStatus'},
      \ 'component_expand': {
      \   'lsp_warnings': 'lightline#lsp#warnings',
      \   'lsp_errors':   'lightline#lsp#errors',
      \   'lsp_ok':       'lightline#lsp#ok',
      \   'lsp_hints':    'lightline#lsp#hints',
      \   'lsp_info':     'lightline#lsp#info',
      \ },
      \ 'component_type': {
      \   'lsp_warnings': 'warning',
      \   'lsp_errors':   'error',
      \   'lsp_ok':       'right',
      \   'lsp_hints':    'hints',
      \   'lsp_info':     'info',
      \ },
      \ }
