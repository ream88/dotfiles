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

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

nmap <C-t> :FZF<CR>
