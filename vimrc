syntax on
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set shortmess-=S

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

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/SimpylFold'
"Plug 'pangloss/vim-javascript'
"Plug 'valloric/youcompleteme'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {'do': 'yarn install','branch': 'release/0.x'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'pbrisbin/alt-ctags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

let mapleader = ","

"This is forvfzf so that I can search in my local projects folder
command! -bang ProjectFiles call fzf#vim#files('~/Documents/Projects', <bang>0)
map <leader>v :Buffers<CR>
map <leader>s :Files<CR>

"This is to remap youcompletemes default accept suggestion
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

let g:coc_global_extensions = ['coc-tsserver', 'coc-pyright']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

let g:javascript_plugin_jsdoc = 1

let g:SimpylFold_docstring_preview = 1
nnoremap <space> za

colorscheme gruvbox
set background=dark
highlight Normal        ctermbg=NONE guibg=NONE
highlight LineNr        ctermbg=NONE guibg=NONE
highlight SignColumn    ctermbg=NONE guibg=NONE

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

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"auto open nerdtree when opening vim
"au VimEnter *  NERDTree | wincmd l 

"ctrl-a select all
nnoremap <leader>a ggVG
nnoremap <silent> <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR><CR>

"sane copy and paste
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

"auto formatting python with black
augroup black_on_save
  autocmd!
    autocmd BufWritePre *.py Black
augroup end
    "
"autocmd BufWritePost * Ctags
