syntax on
colorscheme railscasts

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set number

set ignorecase smartcase

set spelllang=en_gb
syntax spell toplevel

set linebreak

set incsearch
set hlsearch

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

" https://stackoverflow.com/a/16574928/326984
set clipboard+=unnamed
set paste
set go+=a

packloadall

nmap <C-t> :FZF<CR>

silent! helptags ALL

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1

nmap <F8> <Plug>(ale_fix)

