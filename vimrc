syntax on
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nu
set nowrap
set smartcase

set noswapfile
set nobackup

set incsearch

set scrolloff=8 "This is so scroll start moving page down when it reaches 8 rows

set relativenumber
set nohlsearch
set hidden

set colorcolumn=120

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/SimpylFold'
"Plug 'pangloss/vim-javascript'
Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {'do': 'yarn install','branch': 'release/0.x'}
Plug 'pbrisbin/alt-ctags'

call plug#end()

"This is to remap youcompletemes default accept suggestion
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

let g:javascript_plugin_jsdoc = 1

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
map <leader>b :ls<CR>:b

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"auto open nerdtree when opening vim
au VimEnter *  NERDTree

"ctrl-a select all
nnoremap <leader>a ggVG

autocmd BufWritePost * Ctags
