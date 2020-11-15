syntax on
set noerrorbells
set smartindent tabstop=4 shiftwidth=4
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/SimpylFold'

call plug#end()

let g:SimpylFold_docstring_preview = 1
nnoremap <space> za

colorscheme gruvbox
set background=dark

let mapleader = "."
map <Enter> O<ESC>

nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>

nnoremap <leader>o zR
nnoremap <leader>c zM

vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
set clipboard=unnamed
