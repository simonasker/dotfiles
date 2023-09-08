set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
" Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
" Plugin 'nvie/vim-flake8'
" Plugin 'vim-syntastic/syntastic'
Plugin 'klen/python-mode'
Plugin 'psf/black'
Plugin 'tpope/vim-commentary'
" Plugin 'fatih/vim-go'
" Plugin 'junegunn/fzf'
" Plugin 'godlygeek/tabular'
" Plugin 'preservim/vim-markdown'
call vundle#end()

filetype plugin indent on

set updatetime=10
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set t_Co=256
set background=dark
let g:gruvbox_italic=1
let g:solarized_termcolors = 256
colorscheme gruvbox


set noswapfile
set backupcopy=yes
"
set autoindent                  " Start new lines on the same indent level as the current line
" set hlsearch                    " Hightlight matches
" set incsearch                   " Start searchin as soon as characters are entered
" set laststatus=2                " Always display the status line
" set lbr
" set lazyredraw
set encoding=utf-8
set number                      " Display line numbers
" set report=0                    " Always report how many lines are changed
" set scrolloff=4                 " Keep cursor 4 lines away form window edges
" set showcmd                     " Show command in bottom bar
set expandtab                   " Insert the appropriate number of spaces instead of tabs
set shiftround                  " Round indent to multiple of 'shiftwidth'
set shiftwidth=4                " >> indents 4 columns; << unindents 4 columns
set softtabstop=4               " Insert/delete 4 spaces when hitting TAB/BACKSPACE
set tabstop=4                   " A hard TAB displays as 4 columns
set splitbelow                  " New window is placed below the current one
set splitright                  " New window is placed to the right of the current one
set syntax
set fileformat=unix
" set ttyfast                     " Better terminal performance
set wildmenu                    " Extend tab-completion with interactive menu
set wildmode=longest,list,full  " Sensible tab-completion behavior
"
" " set textwidth=100
"
" set report=0
" set belloff=all
"
" " Auto commands ==============================================================
"
" " Remove trailing whitespaces when saving
autocmd BufWritePre * :%s/\s\+$//ge

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType go nnoremap <leader>r :GoRun<CR>
autocmd FileType go nnoremap <leader>t :GoTest -v<CR>

" python-mode =================================================================

let g:pymode_options_max_line_length = 100
" let g:pymode_syntax_space_errors = 0
" let g:pymode_options_colorcolumn = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" let g:pymode_lint = 0
" let g:pymode_lint_on_write = 0

" Highlight trailing whitespace in red
" autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" black ======================================================================

let g:black_fast=1
nnoremap <F9> :Black<CR>
" Run black on saving a python file
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" ============================================================================

" Use Markdown syntax highlighting for .md-files
" autocmd BufNewFile,BufRead *.md set syntax=markdown

" Key bindings ===============================================================

let mapleader = ","

" space open/closes folds
" nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" kj is escape
inoremap kj <Esc>

" move to beginning/end of line
noremap H ^
noremap L $

" Easier split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Cycle through tabs like in firefox
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

" Keep selection after changing indent level
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Use Escape to exit from terminal mode
tnoremap <Esc> <C-\><C-n>
" tnoremap kj <C-\><C-n>
tmap kj <Esc>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

nnoremap <leader>t :split term://bash<CR>
nnoremap <leader>r :!cargo run<CR>
nnoremap <leader>f :FZF<CR>

" let g:netrw_banner=0
" let g:netrw_altv=1
" let g:netrw_liststyle=3

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
