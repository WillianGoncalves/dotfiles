" A VIM config file.
"
" Maintainer:	Willian Goncalves <w.goncalves91@gmail.com>
" Thanks to:    Guilherme Gonçalves <inacio.guilherme@gmail.com>
" Last change:	2017 Out 02
"
" To use it, copy it to
"  for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	 for OpenVMS:  sys$login:.vimrc


set nocompatible               " be iMproved, required
set encoding=utf-8             " Use utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'xolox/vim-session'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'maksimr/vim-jsbeautify', {'do': 'git submodule update --init --recursive'}
Plug 'w0rp/ale'
Plug 'https://github.com/sirver/ultisnips.git'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'suan/vim-instant-markdown', { 'do': 'sudo npm install -g instant-markdown-d' }
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'

call plug#end()

:set linespace=7

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" display line numbers
set numberwidth=1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" search tags
set tags=tags;/

" window settings
syntax enable
colorscheme deep-space 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scrollbar
set guioptions-=L  "remove left-hand scrollbar

" font
set guifont=FuraMonoForPowerline\ Nerd\ Font

" split style for monokay
set fillchars+=vert:\ 
hi! VertSplit guibg=#293031 ctermbg=238

" jsbeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Store swap files in fixed location, not current directory.
set backupdir=/tmp
set undodir=/tmp
set directory=/tmp

" session settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" youcompleteme
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_filepath_blacklist = {}
set completeopt-=preview

" ale
" Fix files with prettier, and then ESLint.
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
nmap <silent> <leader>ne :ALENext<cr>
nmap <silent> <leader>pe :ALEPrevious<cr>

" closetag
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

" current directory abreviation '%%'
cabbr <expr> %% expand('%:p:h')
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

set nowrap
set hlsearch

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set split sides
set splitbelow
set splitright

" Find/Replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" highlighting current line
set cul

" auto refresh files
set autoread

" indentLine
let g:indentLine_enabled=1
let g:indentLine_char='|'
set listchars=tab:\┆\ 
set list

" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
" " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
let NERDTreeShowHidden=1
let NERDTreeNodeDelimiter="\u00a0"

" disable auto-hide
let g:vim_json_syntax_conceal = 0
set conceallevel=0
set cole=0 
au FileType * setl cole=0 

" spell
set nospell

" default tabsize
set tabstop=2
set shiftwidth=2
set expandtab

" CTRLP settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignores files .gitignore

" airline
set laststatus=2
let g:airline_theme='lucius'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#hunks#enabled=0

" nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" hide end of buffer '~'
"if has('gui_running')
    "hi! EndOfBuffer guibg=bg guifg=bg
"else 
    "hi! EndOfBuffer ctermbg=bg ctermfg=bg
"endif

" config hidden characters exibition.
" use with ':set list' and disable with ':set nolist'
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set nolist

" map :nohl to back slask (Leader)
nnoremap <silent> <Leader>/ :nohlsearch<CR>

let g:vue_disable_pre_processors=1
set scrolloff=5

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" improve ruby performance
set regexpengine=1
set lazyredraw

" disable polyglot language packs to avoid conflict with other plugins
let g:polyglot_disabled = ['latex']

command FormatJson set syntax=json | %!python -m json.tool

" close other tabs
command Qo %bd|e#
