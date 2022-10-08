set nocompatible
colo torte 
syntax on
filetype plugin indent on

set ts=4 sts=4 sw=4 et ai si
set encoding=utf-8
set relativenumber
set nohlsearch
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set updatetime=300
set rnu
set cmdheight=2

set splitbelow
set splitright
" set the backspace to delete normally
set backspace=indent,eol,start

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Automatically complete braces
noremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

vnoremap < <gv
vnoremap > >gv

" Enable folding
set foldmethod=indent
set foldlevel=99

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting



" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
    let col = col('.')
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" " Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()


inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
