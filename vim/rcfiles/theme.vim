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
