set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'rakr/vim-one'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
call vundle#end()

filetype plugin indent on

"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"
set updatetime=10
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set termguicolors
set t_Co=256
set background=dark
let g:gruvbox_italic=1
" colorscheme base16-onedark
colorscheme gruvbox
"
" set autoindent                  " Start new lines on the same indent level as the current line
" set cursorline                  " Highlight the current line
" set directory=~/.vim/swap       " Specify where swap files are placed
" set hlsearch                    " Hightlight matches
" set incsearch                   " Start searchin as soon as characters are entered
" set laststatus=2                " Always display the status line
" set lbr
" set lazyredraw
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
" set ttyfast                     " Better terminal performance
set wildmenu                    " Extend tab-completion with interactive menu
set wildmode=longest,list,full  " Sensible tab-completion behavior
"
" " set textwidth=100
"
" set splitright
" set splitbelow
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

nnoremap <leader>t :split term://zsh<CR>
nnoremap <leader>f :FZF<CR>

let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 2
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
