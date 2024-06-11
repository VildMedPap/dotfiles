set relativenumber number
set scrolloff=999

" Disable backup files
set nobackup
set nowritebackup

" Disable swap files if you don't need crash recovery
set noswapfile

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set tabstop=4           " use 4 spaces to represent tab
set shiftwidth=4        " number of spaces to use for auto indent
set expandtab           " enter spaces when tab is pressed
set softtabstop=4       " treat groups of 4 spaces as tab 
set autoindent          " copy indent from current line when starting a new line 
set encoding=utf-8
set fileencoding=utf-8
syntax on

" Disable arrow keys in normal and visual modes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Override for Makefiles to use tabs
autocmd FileType make set noexpandtab
autocmd FileType make set tabstop=4
autocmd FileType make set shiftwidth=4
autocmd FileType make set softtabstop=0
