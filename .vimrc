" ================ Plugin Management ================
call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'mhinz/vim-startify'
call plug#end()
" ================ General Settings ================
set nocompatible              " Disable compatibility with legacy Vim
filetype plugin indent on
" Leader key
let mapleader=" "             " Set leader key to ' '

" Make background transparent
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi Folded guibg=NONE ctermbg=NONE

" Performance
set lazyredraw                " Faster redrawing

" Basic Usability
set number                    " Show line numbers
set relativenumber            " Relative line numbers
set cursorline                " Highlight current line
set scrolloff=8               " Keep 8 lines visible above/below cursor
set signcolumn=yes            " Always show the sign column
set mouse=a                    " Disable mouse support
set clipboard=unnamedplus     " Use system clipboard
set hidden                    " Allow switching buffers without saving
set updatetime=1000           " Increase to reduce update frequency
set shortmess+=c              " Don't show completion messages

" Indentation
set autoindent                " Automatic indentation
set smartindent               " Smarter indentation
set tabstop=4                 " Number of spaces for a tab
set shiftwidth=4              " Indentation width
set expandtab                 " Use spaces instead of tabs

" Searching
set ignorecase                " Ignore case in search
set smartcase                 " Smart case sensitivity
set hlsearch                  " Highlight search results
set incsearch                 " Incremental search
set wrapscan                  " Wrap around search

" Backup and Undo
set undodir=~/.vim/undodir    " Directory for undo files
set undofile                  " Persistent undo
set noswapfile                " Disable swap files
set nobackup                  " Disable backups

" UI Enhancements
set showcmd                   " Show command in the last line
set showmode                  " Show mode
set wildmenu                  " Visual autocomplete for command menu
set laststatus=2              " Always display status line
syntax on                     " Enable syntax highlighting
set termguicolors             " Enable 24-bit colors

" Color Scheme
colorscheme catppuccin_mocha

" ================ Basic Mappings ================
" Set leader key to space (easier to reach than default '\')
let mapleader = "\<space>"

" ================ Mode Switching ================
" Exit insert mode with 'jk' (faster than reaching for Esc)
inoremap jk <Esc>

" ================ File Operations ================
" Save file with Ctrl+S (familiar to most users)
nnoremap <C-s> :w<CR>
" Save file from insert mode with Ctrl+S
inoremap <C-s> <Esc>:w<CR>i
" Quick save with leader+w
nnoremap <leader>w :w<CR>
" Quick quit with leader+q
nnoremap <leader>q :q<CR>
" Save and quit with leader+x
nnoremap <leader>x :x<CR>

" ================ Navigation ================
" Go to previous buffer
nnoremap <leader>h :bprev<CR>
" Go to next buffer
nnoremap <leader>l :bnext<CR>
" List buffers and prepare for buffer selection
nnoremap <leader>b :ls<CR>:b<Space>
" Delete current buffer
nnoremap <leader>bd :bd<CR>

" Window navigation using Ctrl + hjkl (instead of Ctrl+W+hjkl)
nnoremap <C-h> <C-w>h    " Move to left window
nnoremap <C-j> <C-w>j    " Move to window below
nnoremap <C-k> <C-w>k    " Move to window above
nnoremap <C-l> <C-w>l    " Move to right window

" Jump to start of line (instead of 0)
nnoremap H ^
" Jump to end of line (instead of $)
nnoremap L $

" ================ Window Management ================
" Increase window height by 2 lines
nnoremap <leader>+ :resize +2<CR>
" Decrease window height by 2 lines
nnoremap <leader>- :resize -2<CR>
" Increase window width by 2 columns
nnoremap <leader>> :vertical resize +2<CR>
" Decrease window width by 2 columns
nnoremap <leader>< :vertical resize -2<CR>

" ================ Search and Replace ================
" Clear search highlighting
nnoremap <leader>n :nohlsearch<CR>

" Replace word under cursor (forward)
nnoremap <leader>r *``cgn
" Replace word under cursor (backward)
nnoremap <leader>R #``cgN

" ================ Clipboard Operations ================
" Copy to system clipboard in visual mode
vnoremap <C-c> "+y
" Paste from system clipboard in normal mode
nnoremap <C-p> "+p
" Paste from system clipboard in insert mode
inoremap <C-v> <Esc>"+pa

" ================ Function Keys ================
" F2: Toggle paste mode (useful when pasting formatted text)
set pastetoggle=<F2>
" F3: Toggle line numbers
nnoremap <F3> :set number!<CR>
" F4: Toggle relative line numbers
nnoremap <F4> :set relativenumber!<CR>
" F5: Reload vimrc
nnoremap <F5> :source $MYVIMRC<CR>

" ================ Quick Config Access ================
" Open vimrc in a new buffer
nnoremap <leader>ve :edit $MYVIMRC<CR>
" Reload vimrc
nnoremap <leader>vs :source $MYVIMRC<CR>

" ================ Startify Configuration ================
" Session directory
let g:startify_session_dir = '~/.vim/session'[1]

" Custom startify lists
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent Files']   },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }
    \ ]

" Bookmarks
let g:startify_bookmarks = [
    \ { 'v': '~/.vimrc' },
    \ { 'z': '~/.zshrc' },
    \ { 'x': '~/Code+Notes/Todo.md' },
    \ { 'w': '~/.wezterm.lua' },
    \ { 't': '~/.tmux.conf' },
    \ ]

" Session options
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1

" Other settings
let g:startify_files_number = 8
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

" Add these mappings to your existing mappings section
nnoremap <leader>st :Startify<CR>
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sl :SLoad<CR>
