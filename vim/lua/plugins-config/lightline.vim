" code extracted from ":h lightline-colorscheme" then search for "lightline-problem-13"
augroup LightlineColorscheme
  autocmd!
  autocmd ColorScheme * call s:lightline_update()
  autocmd VimEnter * call s:lightline_update()
augroup END

function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    let g:lightline.colorscheme = g:colors_name
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  catch
  endtry
endfunction

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
