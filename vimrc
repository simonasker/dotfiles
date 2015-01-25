filetype plugin indent on
syntax on

set number              " display line numbers
set cursorline          " highlight the current line

set shiftwidth=4        " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4           " a hard TAB displays as 4 columns
set expandtab           " insert spaces then hitting TABs
set softtabstop=4       " insert/delete 4 spaces when hitting TAB/BACKSPACE
set shiftround          " round indent to multiple of 'shiftwidth'
set autoindent          " align the new line indent with the previous line

set nocompatible

" Keep cursor 4 lines away form window edges
set scrolloff=4

" Remove trailing whitespaces when writing a buffer to file
autocmd BufWritePre * :%s/\s\+$//ge

set directory=~/.vim/swap

" PythonMode ==================================================================

let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" =============================================================================

" Reselect visual blocks after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Remap leader to comma
let mapleader = ","

" A more handy Esc
inoremap kj <Esc>

" Jumpt to start and end of line using home row keys
noremap H ^
noremap L $

" Cycle through tabs like in firefox
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
